import Foundation
import Combine
import os
import JoliCore
import Version

#if os(macOS)
import AppKit
#else
import UIKit
#endif

public struct TrackInfo {
    public var track: Track?
    public var info: Json?
}

internal let logger = Logger(subsystem: "live.joli.JoliApi", category: "global.api")


// MARK: - JoliApi
public class JoliApi: ObservableObject, HttpApi {
    
    #if DEBUG
    public static let debug = true
    #else
    public static let debug = false
    #endif
    
    @Published public var currentPlaying: TrackInfo?
    @Published public var currentPlayingTrack: Track?
    
    @Published public var auth: Auth? {
        didSet {
            self.urlSessionConfiguration = self.urlSessionConfiguration.withAuthHeader(auth?.session.token)
        }
    }
    
    public func addTrackToRoom(_ room: Musicroom, _ track: Spotify.Track) async throws -> Json {
        return try await room.addTrack(track, baseUrl: self.baseUrl.rawValue.http, urlSession: self.urlSession)
    }

    // MARK: - Environment
    public enum Environment: String, CustomStringConvertible {
        
        public static var CACHED_ENV_CONFIG: [String: AnyObject] = [:]
        
        case local
        case development
        case production
        
        public static func loadEnvConfig(from bundle: Bundle? = nil) {
            
            let bundle = bundle ?? Bundle.main
            guard let filePath = bundle.path(forResource: "env", ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
                  let json: [String: AnyObject] = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else {
                return
            }
            
            Self.CACHED_ENV_CONFIG.merge(json) { (_, new) in new }
            logger.debug("[JoliApi.Environment] loaded env config: \(Self.CACHED_ENV_CONFIG)")
        }
        
        public static var current: Environment {
            guard debug else {
                return .production
            }
            
            let json = CACHED_ENV_CONFIG
            return Environment(rawValue: json["env"] as? String ?? Environment.local.rawValue) ?? .development
        }
        
        public var baseUrl: BaseUrl {
            switch self {
            case .local:
                guard let host: String = (Self.CACHED_ENV_CONFIG["host"] as? [String: AnyObject])?["local"] as? String else {
                    let defaultLocalUrl: BaseUrl = .host("localhost")
                    logger.debug("[Environment] using default: \(defaultLocalUrl)")
                    return defaultLocalUrl
                }
                return .host(host)
            case .development:
                return .dev
            case .production:
                return .prod
            }
        }
        
        public var description: String {
            return rawValue
        }
    }
    
    public enum BaseUrl: RawRepresentable, CustomStringConvertible {
        
        case dev
        case prod
        
        case localhost
        case homeLaptop
        case homeDesktop
        case mobileHotspot
        
        case host(String)
        case custom((http: URL, ws: URL))
        
        public static var defaultDevUrl = URL(staticString: "https://dev.jolimc.com")
        public static var defaultProdUrl = URL(staticString: "https://dev.jolimc.com")
        
        public var description: String {
            return String(describing: rawValue)
        }
        
        public var rawValue: (http: URL, ws: URL) {
            switch self {
            case .dev:
                return (http: Self.defaultDevUrl, ws: Self.defaultDevUrl)
            case .prod:
                return (http: Self.defaultProdUrl, ws: Self.defaultProdUrl)
            case .localhost:
                return (http: URL(staticString: "https://localhost:8080"), ws: URL(staticString: "wss://localhost:8080"))
            case .homeLaptop:
                return (http: URL(staticString: "https://192.168.1.173:8080"), ws: URL(staticString: "wss://192.168.1.173:8080"))
            case .homeDesktop:
                return (http: URL(staticString: "https://192.168.1.188:8080"), ws: URL(staticString: "wss://192.168.1.188:8080"))
            case .mobileHotspot:
                return (http: URL(staticString: "https://172.20.10.2:8080"), ws: URL(staticString: "wss://172.20.10.2:8080"))
            case .host(let urlString):
                return (http: URL(string: "https://\(urlString)")!, ws: URL(string: "wss://\(urlString)")!)
            case .custom(let urls):
                return urls
            }
        }
        
        public var http: URL {
            return rawValue.http
        }
        
        public var ws: URL {
            return rawValue.ws
        }
        
        public init?(rawValue: String) {
            self = .host(rawValue)
        }
        
        public init?(rawValue: (http: URL, ws: URL)) {
            self = .custom(rawValue)
        }
    }
    
    public var env: Environment {
        get { Environment.current }
        set {
            Environment.CACHED_ENV_CONFIG["env"] = newValue.rawValue as AnyObject
        }
    }
    
    public enum AuthCredentials {
        case sessionToken(String)
        case email(String, String)
        case spotifyRefreshToken(String)
        case apple(String, String, String, String, String)
    }
    
    public func accountDelete() async throws -> Bool {
        let res = try await HttpMethod.delete.fetchJson(urlPath: URLComponents(string: "/api/account")!, payload: [:], baseUrl: baseUrlHttp, urlSession: urlSession)
        //print("[accountDelete] res: \(String(describing: res))")
        
        guard let status = res["status"] as? Int else { return false }
        
        return status == 200
    }
    
    @discardableResult
    public func authenticate(_ credentials: AuthCredentials, urlSession: URLSession? = nil) async throws -> Auth? {
        
        switch credentials {
            case .email(let email, let password):
                return try await Session.fromCredentials(email: email, password: password, baseUrl: self.baseUrl.rawValue.http, urlSession: urlSession ?? self.urlSession)
            case .sessionToken(let token):
                
                guard !token.isEmpty else {
                    return nil
                }
                
                return try await Session.fromCredentials(token: token, baseUrl: self.baseUrl.rawValue.http, urlSession: urlSession ?? self.urlSession)
            case .spotifyRefreshToken(let refreshToken):
                return try await Session.fromCredentials(spotifyRefreshToken: refreshToken, baseUrl: self.baseUrl.rawValue.http, urlSession: urlSession ?? self.urlSession)
            case .apple(let name, let email, let userId, let idToken, let authToken):
                return try await Session.fromCredentials(name: name, email: email, userId: userId, idToken: idToken, authCode: authToken,
                                               baseUrl: self.baseUrl.rawValue.http, urlSession: urlSession ?? self.urlSession)
        }
    }

    @discardableResult
    public func authenticate(email: String, password: String, urlSession: URLSession? = nil) async throws -> Auth? {
        do {
            return try await Session.fromCredentials(email: email, password: password, baseUrl: self.baseUrl.rawValue.http, urlSession: urlSession ?? self.urlSession)
        } catch {
            logger.error("[authenticate] error: \(String(describing: error))")
            throw error
        }
    }
    
    @discardableResult
    public func authenticate(token: String, urlSession: URLSession? = nil) async throws -> Auth? {
        return try await Session.fromCredentials(token: token, baseUrl: self.baseUrl.rawValue.http, urlSession: urlSession ?? self.urlSession)
    }
    
    public func setNotificationToken(_ token: String, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> Device {
        return try await HttpMethod.Fetch.post(url: "/api/apn", dataType: Device.self, payload: .json(["token": token as AnyObject]), baseUrl: self.baseUrlHttp, urlSession: self.urlSession)
    }
    
    public func searchSpotify(q: String, categories: Set<Search.Category> = [.tracks], limit: Int = 10) async throws -> Spotify.SearchResult {
        
        let typeStr = Array(categories).map() { $0.label.lowercased() }.joined(separator: ",")
        var pathComp = URLComponents(string: "/api/spotify/search")!
        
        pathComp.queryItems = [
            URLQueryItem(name: "q", value: q),
            URLQueryItem(name: "limit", value: limit.description),
            URLQueryItem(name: "type", value: typeStr)
        ]
        
        return try await HttpMethod.Fetch.get(url: pathComp, dataType: Spotify.SearchResult.self, baseUrl: baseUrlHttp, urlSession: self.urlSession)
    }
    
    @discardableResult
    public func setVolume(_ volume: Int, deviceId: String, on: DispatchQueue? = nil) async throws -> Json {
        let payload: Json = ["deviceId": deviceId as AnyObject,
                             "volume": volume as AnyObject]
        let urlPath = URLComponents(string: "/api/spotify/volume")!
        return try await HttpMethod.post.fetchJson(urlPath: urlPath, payload: payload, baseUrl: baseUrlHttp, urlSession: self.urlSession)
    }

    public var user: User?
    public var wsClient: WebSocketClient

    public var subjects: Set<String> = []
    public var baseUrl: BaseUrl {
        didSet {
            
        }
    }
    
    public var baseUrlHttp: URL {
        return baseUrl.http
    }
    
    public var baseUrlWs: URL {
        return baseUrl.ws
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    public var urlSessionConfiguration: URLSessionConfiguration {
        didSet {
            self.setupUrlSession()
        }
    }
    public var urlSession: URLSession = JoliApi.sharedUrlSession
    
    // MARK: - init
    public init(baseUrl: BaseUrl = .localhost, authToken: String? = nil, headers: HttpMethod.Headers = [:]){
        
        self.urlSessionConfiguration = JoliApi.sharedUrlSession.configuration.withAuthHeader(authToken)
        self.urlSessionConfiguration.httpAdditionalHeaders?.merge(headers) { $1 }
        
        self.baseUrl = baseUrl
        let wsUrl = baseUrl.ws.appendingPathComponent(Self.debug ? "/api/ws" : "/ws")
        self.wsClient = WebSocketClient(url: wsUrl, headers: headers, trustedHosts: JoliApi.sharedUrlSessionDelegate.trustedHosts + [baseUrl.http.host!])
        
        //(ws: URL, http: URL)
        BASE_URL = baseUrl.rawValue
        self.setupUrlSession()
    }
    
    private func setupUrlSession() {
        urlSession = JoliApi.sharedUrlSession.updated(configuration: self.urlSessionConfiguration)
        
        guard let host = self.baseUrl.http.host,
              var trustedHosts = (urlSession.delegate as? HttpsHook)?.trustedHosts,
              !trustedHosts.contains(host)
        else {
            return
        }
        
        trustedHosts.append(host)
    }
    
    public enum Subject: String, CustomStringConvertible {
        case playerStateChanged = "PLAYER_STATE_CHANGED"
        case playerStateNowPlaying = "PLAYER_STATE_NOW_PLAYING"
        case activityFeed = "activity_feed"
        case dbUpdates = "database_updates"
        case queryTrackSearch = "QUERY_TRACK_SEARCH"
        
        public var description: String {
            return rawValue
        }
    }
    
    public func subscribe(subject: Subject, onMessage: @escaping WebSocketClient.ResponseCallback) async {
        let headers = self.urlSessionConfiguration.httpAdditionalHeaders as? HttpMethod.Headers
        
        do {
            try await self.wsClient.subscribe(subject.rawValue, headers: headers, handler: onMessage)
            logger.debug("[JoliApi#subscribe] subject=\(subject)")
        } catch {
            logger.error("[wsSubscribe] error: \(String(describing: error))")
        }
    }
    
//    public func unsubscribe(subject: Subject){
//        let topic = "/unsubscribe?subject=\(subject.rawValue)"
//        let headers = self.urlSessionConfiguration.httpAdditionalHeaders as? HttpMethod.Headers
//        self.wsClient.send(topic: topic, headers: headers) { error in
//            if let error = error {
//                logger.debug("[wsUnsubscribe] error: \(error)")
//                return
//            }
//
//            logger.debug("[JoliApi#unsubscribe] subject=\(subject)")
//            self.subjects.remove(subject)
//        }
//    }
    
    public func fetchSpotifyDevices() async throws -> [Spotify.Device] {
        let baseUrl = self.baseUrl.rawValue.http
        let dict = try await HttpMethod.Fetch.get(url: "/api/spotify/devices", dataType: [String: [Spotify.Device]].self, baseUrl: baseUrl, urlSession: self.urlSession)
        
        guard let devices = dict["devices"] else {
            throw NetworkError.badResponse("expected key \"devices\" in response: \(dict)")
        }
        
        return devices
    }
    
    public func fetchSpotifyUserProfile() async throws -> Spotify.UserProfile {
        return try await HttpMethod.Fetch.get(url: "/api/spotify/me", dataType: Spotify.UserProfile.self, baseUrl: self.baseUrl.rawValue.http, urlSession: self.urlSession)
    }
    
    @discardableResult
    public func delete<T>(_ model: T) async throws -> T where T: Persisted {
        return try await model.delete(baseUrl: self.baseUrl.rawValue.http, urlSession: urlSession)
    }
    
    // MARK: - Test
//    @discardableResult
//    public static func doTest() -> some Promise<Any?> {
//        JoliApi.initLogger()
//
//        //let urlSession = URLSession(configuration: .default)
//        //let url = URL(string: "http://localhost:8080/api/db/musicrooms")!
//        //debugPrint("names: \(Musicroom(name: "test").propertyValues())")
//        let api = JoliApi(baseUrl: .localhost)
//        let url: BaseUrl = api.baseUrl
//
//        let res = [Track].fromString("""
//        [
//            {
//                "id": 1,
//                "created_by_id": 1,
//                "created_at": "2019-10-01T09:18:56Z",
//                "updated_at": "2019-10-01T09:18:56Z",
//                "title": "Fever",
//                "track_id": "5mN3xSyvCmFy1jkdA98IfS",
//                "thumbnail_url": "https://i.scdn.co/image/ab67616d000048512e74362b470526cda9f124eb",
//                "artist_name": "WizKid",
//                "uri": "spotify:track:5mN3xSyvCmFy1jkdA98IfS"
//            }
//]
//""")
//        logger.debug("[QT] \(api)")
//        return Promise(nil)
        //JoliApi.sharedUrlSession.configuration = JoliApi.sharedUrlSession.configuration
        
//        return api.authenticate(email: "hawa@gmail.net", password: "Password@")
//            .then(){ res -> Promise<Spotify.UserProfile> in
//                logger.debug("[AUTH] \(res)")
//                return api.fetchSpotifyUserProfile()
//                    .then() { logger.debug("user: \($0)") }
//                    .catch { logger.error("[ERROR] devices: \($0)") }
//        }.catch() {
//            logger.error("[ERROR] \($0)")
//        }
        
//        api.fetchSpotifyDevices().then { print($0) }
//        return api.searchTracks(q: "killin")
//            .then() { print($0) }
//            .catch() { error in print(error) }
//        return Session.fromCredentials(email: "hawa@gmail.net", password: "Password@", baseUrl: url.rawValue.http)
//            .then() { res in
//                logger.debug("[RESP] \(res)")
//        }.catch() { error in
//            logger.debug("[ERROR] \(error)")
//        }
        
//        return Musicroom.all(baseUrl: url.rawValue.http, on: .global(qos: .background))
//            .then() { rooms in
//                logger.debug("[rooms] \(rooms)")
//        }.catch() { err in
//            logger.error("[Musicroom] \(err)")
//        }
//
//        return Musicroom.findById(id: 1, baseUrl: url.rawValue.http, on: .global(qos: .background))
//        .then() { (res) -> Promise<[Track]> in
//            var r = res!
//            debugPrint(r)
//
////            let m = Mirror(reflecting: r)
////
////            for c in m.children {
////                logger.debug("child: \(c)")
////            }
//
//            //r.name = "Davido Party"
//
//            debugPrint("response: \(String(describing: r.$createdAt)) - \(String(describing: r.createdAt))")
//            return Promise([])//r.fetchTracks()
//        }
//        .catch() { error in
//            logger.debug("error: \(error)")
//        }
        
    //}
    
    public static var sharedUrlSessionDelegate = HttpsHook(trustedHosts: [
       BaseUrl.homeLaptop.rawValue.http.host!,
       BaseUrl.homeDesktop.rawValue.http.host!,
       BaseUrl.mobileHotspot.rawValue.http.host!,
       BaseUrl.localhost.rawValue.http.host!,
       BaseUrl.dev.rawValue.http.host!,
       URL(staticString: "https://dev.jolimc.com").host!,
       URL(staticString: "https://169.254.249.58:3000").host!,
       URL(staticString: "https://192.168.150.169:8090").host!,
       URL(staticString: "https://192.168.1.106:8080").host!,
       URL(staticString: "https://192.168.1.26:8080").host!,
       URL(staticString: "https://192.168.1.233:8080").host!,
       URL(staticString: "https://192.168.1.107:8080").host!,
    ])
    
    public static var sharedUrlSession = URLSession.init(configuration: URLSessionConfiguration.default,
                                                  delegate: JoliApi.sharedUrlSessionDelegate, delegateQueue: .main)
    
}

public extension URLSessionConfiguration {
    
    func withAuthHeader(_ authToken: String?) -> URLSessionConfiguration {

        let config = self
        var headers = config.httpAdditionalHeaders ?? [:]
        
        if let authToken = authToken {
            headers["X-SESSION-ID"] = authToken
        } else {
            headers.removeValue(forKey: "X-SESSION-ID")
        }
        
        config.timeoutIntervalForRequest = 10
        config.httpAdditionalHeaders = headers
        return config
    }
    
}

public struct ServerInfo: CustomStringConvertible {
    
    public var description: String {
        return "ServerInfo(version: \(version), feature: \(feature), preferredClientVersion: \(String(describing: preferredClientVersion))"
    }
    
    public struct Feature: CustomStringConvertible {
        public var paymentsEnabled = false
        
        public var description: String {
            return "\(Self.self)(paymentsEnabled: \(paymentsEnabled))"
        }
    }
    
    public let version: Version
    public let feature: Feature
    public let preferredClientVersion: Version?
    
}

public extension JoliApi {
    
    func createMusicroom(name: String, details: String, on: DispatchQueue? = nil) async throws -> Musicroom {
        let musicroom = Musicroom.build([.name: name as AnyObject, .details: details as AnyObject])
        return try await musicroom.save(baseUrl: baseUrl.rawValue.http, urlSession: urlSession)
    }
    
    
    enum VersionResolveError: Error {
        case unrecognisedResponseType
        case noResponseReceived
        case missingVersionField
        case malformedString(String)
        case malformedBaseUrl(URL)
    }
    
    static func insensitiveGet<V>(_ dictionary: [AnyHashable: Any], key: String, valueType: V.Type) -> V? {
        return (dictionary[key] ?? dictionary[key.lowercased()]) as? V
    }
    
    static func resolveServer(_ baseUrl: URL) async throws -> ServerInfo {
            
        guard let url = URL(string: "/status", relativeTo: baseUrl) else {
            throw VersionResolveError.malformedBaseUrl(baseUrl)
        }
        
        var req = URLRequest(url: url)
        req.httpMethod = HttpMethod.head.rawValue
        
        let (_, response) = try await JoliApi.sharedUrlSession.data(from: req)
        
        guard let resp = response as? HTTPURLResponse else {
            throw VersionResolveError.unrecognisedResponseType
        }
        
        guard let versionStr = insensitiveGet(resp.allHeaderFields, key: "X-Server-Version", valueType: String.self) else {
            print("[Missing HEADERS] \(resp.allHeaderFields)")
            throw VersionResolveError.missingVersionField
        }

        guard let version = Version(versionStr) else {
            throw VersionResolveError.malformedString(versionStr)
        }
        
        let paymentsEnabled = insensitiveGet(resp.allHeaderFields, key: "X-Server-Payments-Enabled", valueType: String.self) == "1"
        let preferredClientVersionStr = insensitiveGet(resp.allHeaderFields, key: "X-Preferred-Client-Version-iOS", valueType: String.self) ?? ""
        
        return ServerInfo(version: version, feature: ServerInfo.Feature(paymentsEnabled: paymentsEnabled), preferredClientVersion: Version(preferredClientVersionStr))
    }
    
}

#if os(macOS)
public extension NSImage {
    
    static func convertImage(_ image: NSImage, to imageType: NSBitmapImageRep.FileType) -> Data? {
        guard let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
            return nil
        }
        
        let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
        return bitmapRep.representation(using: imageType, properties: [:])
    }
    
    func jpegData(compressionQuality: Double? = nil) -> Data? {
        return Self.convertImage(self, to: .jpeg)
    }
    
    func pngData() -> Data? {
        return Self.convertImage(self, to: .png)
    }
    
}
#endif

public extension JoliApi {
    
    static func createMultipartBody(data: Data, boundary: String, file: String) -> Data {
        var body = Data()
        let ln = "\r\n"
        let boundaryPrefix = "--\(boundary)\(ln)"
        body.append(boundaryPrefix)
        body.append("Content-Disposition: form-data; name=\"\(file)\"; filename=\"\(file)\"\(ln)")
        body.append("Content-Type: application/octet-stream;charset=utf-8\(ln + ln)")
        body.append(data)
        body.append(ln)
        body.append("--\(boundary)--\(ln)")
        return body
    }
    
    @available(iOS 14.0, *)
    static func upload(_ image: UIImage, fileName: String? = nil, ext: ImageExtension = .jpeg, timeout: TimeInterval = 60.0, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> URL {
        
        let fileName = fileName ?? "\(ShortCodeGenerator.getCode().lowercased()).\(ext.rawValue)"
        
        let fileExt = URL(fileURLWithPath: fileName).pathExtension
        guard let extResolved = ImageExtension(rawValue: fileExt), extResolved == ext else {
            print("[upload] Unable to resolve extension: \(fileExt)")
            throw NetworkError.badRequest("Invalid file extension \"\(fileExt)\"")
        }
        
        
        guard let imageData = (ext == .jpeg ? image.jpegData(compressionQuality: 0.2) : image.pngData()) else {
            throw NetworkError.badRequest("Unable to convert image to data")
        }
        
        let boundary = "Boundary-562F49C8-26CD-4D87-9C8F-DEA380DE4BF007"
        let url = URL(string: "/images", relativeTo: baseUrl)!
        
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethod.post.rawValue
        
        let data = Self.createMultipartBody(data: imageData, boundary: boundary, file: fileName)
        urlRequest.httpBody = data
        urlRequest.timeoutInterval = timeout
        
        urlRequest.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(data.count.description, forHTTPHeaderField: "Content-Length")
        
        let session = urlSession ?? URLSession.shared
        
        print("actual size of image in Mb: \(imageData.sizeFormatted)")
        
        return try await withCheckedThrowingContinuation() { continuation in
            let task = session.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                
                guard error == nil else {
                    continuation.resume(throwing: NetworkError.badResponse(error!.localizedDescription))
                    return
                }
                
                guard let data = data,
                      let json = try? JSONSerialization.jsonObject(with: data, options: []) as? Json,
                      let fileName = json["fileName"] as? String,
                      let url = URL(string: fileName, relativeTo: baseUrl) else {
                          continuation.resume(throwing: NetworkError.badResponse("Deserialization error - image upload \(ext) \(String(data: data ?? Data(), encoding: .utf8))"))
                    return
                }
                
                continuation.resume(returning: url)
            }
            
            task.resume()
        }
    }
}

public enum ImageExtension: String, CaseIterable {
    
    case jpeg = "jpg"
    case png = "png"
    
    public init?(rawValue: String) {
        switch rawValue.lowercased() {
            case Self.png.rawValue:
                self = .png
            case Self.jpeg.rawValue, "jpeg":
                self = .jpeg
            default:
                return nil
        }
    }
    
}

public struct ShortCodeGenerator {

    private static let base62chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".unicodeScalars.map() {
        Character($0)
    }
    
    private static let maxBase: UInt32 = 62

    static func getCode(withBase base: UInt32 = maxBase, length: Int = 16) -> String {
        var code = ""
        for _ in 0..<length {
            let random = Int(arc4random_uniform(min(base, maxBase)))
            code.append(base62chars[random])
        }
        return code
    }
}
