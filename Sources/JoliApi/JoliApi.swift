import Foundation
import Promises
import Combine
import SwiftyBeaver
import JoliCore
import Version


public struct TrackInfo {
    public var track: Track?
    public var info: Json?
}

internal let logger = SwiftyBeaver.self


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
    
    //public var playerStateDelegate?
    
    private static var loggerInitialized = false

    public static func initLogger() {
        guard !JoliApi.loggerInitialized else { return }
        
        let console = ConsoleDestination()  // log to Xcode Console
        let file = FileDestination()  // log to default swiftybeaver.log file
        
        logger.addDestination(console)
        logger.addDestination(file)
        
        logger.debug("[JoliApi] initialized logger")
        JoliApi.loggerInitialized = true
    }
    
    public static func getLogger() -> SwiftyBeaver.Type {
        JoliApi.initLogger()
        return logger.self
    }
    
    public func addTrackToRoom(_ room: Musicroom, _ track: Spotify.Track, on: DispatchQueue? = nil) -> Promise<Json>{
        return room.addTrack(track, baseUrl: self.baseUrl.rawValue.http, urlSession: self.urlSession
            , on: on)
    }

    // MARK: - Environment
    public enum Environment: String {
        
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
    }
    
    public enum BaseUrl: RawRepresentable {
        
        case dev
        case prod
        
        case localhost
        case homeLaptop
        case homeDesktop
        case mobileHotspot
        
        case host(String)
        case custom((http: URL, ws: URL))
        
        public var rawValue: (http: URL, ws: URL) {
            switch self {
            case .dev:
                return (http: URL(string: "https://dev.jolimc.com")!, ws: URL(string: "wss://dev.jolimc.com")!)
            case .prod:
                //return (http: URL(string: "https://jolimc.com")!, ws: URL(string: "wss://jolimc.com")!)
                return (http: URL(string: "https://dev.jolimc.com")!, ws: URL(string: "wss://dev.jolimc.com")!)
            case .localhost:
                return (http: URL(string: "https://localhost:8080")!, ws: URL(string: "wss://localhost:8080")!)
            case .homeLaptop:
                return (http: URL(string: "https://192.168.1.173:8080")!, ws: URL(string: "wss://192.168.1.173:8080")!)
            case .homeDesktop:
                return (http: URL(string: "https://192.168.1.188:8080")!, ws: URL(string: "wss://192.168.1.188:8080")!)
            case .mobileHotspot:
                return (http: URL(string: "https://172.20.10.2:8080")!, ws: URL(string: "wss://172.20.10.2:8080")!)
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

    @discardableResult
    public func authenticate(email: String, password: String, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Auth?> {
        return Session.fromCredentials(email: email, password: password, baseUrl: self.baseUrl.rawValue.http, urlSession: urlSession ?? self.urlSession, on: on)
            .then() { auth -> Auth? in
                self.auth = auth
                return auth
        }.catch() { error in
            logger.error("[authenticate] error: \(error)")
        }
    }
    
    @discardableResult
    public func authenticate(token: String, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Auth?> {
        return Session.fromCredentials(token: token, baseUrl: self.baseUrl.rawValue.http, urlSession: urlSession ?? self.urlSession, on: on)
            .then() { auth -> Auth? in
                self.auth = auth
                //logger.debug("[JoliApi#authenticate] AUTH: \(auth)")
                return auth
            }
    }
    
    public func setNotificationToken(_ token: String, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Device> {
        return HttpMethod.Fetch.post(url: "/api/apn", dataType: Device.self, payload: .json(["token": token as AnyObject]), urlSession: self.urlSession)
    }
    
    public func searchTracks(q: String, categories: Set<Search.Category> = [.tracks], limit: Int = 10) -> Promise<Spotify.SearchResult> {
        
        let typeStr = Array(categories).map() { $0.label.lowercased() }.joined(separator: ",")
        var pathComp = URLComponents(string: "/api/spotify/search")!
        
        pathComp.queryItems = [
            URLQueryItem(name: "q", value: q),
            URLQueryItem(name: "limit", value: limit.description),
            URLQueryItem(name: "type", value: typeStr)
        ]
        
        return HttpMethod.Fetch.get(url: pathComp, dataType: Spotify.SearchResult.self, urlSession: self.urlSession)
    }
    
    @discardableResult
    public func setVolume(_ volume: Int, deviceId: String, on: DispatchQueue? = nil) -> Promise<Json>{
        let payload: Json = ["deviceId": deviceId as AnyObject,
                             "volume": volume as AnyObject]
        let urlPath = URLComponents(string: "/api/spotify/volume")!
        return HttpMethod.post.fetchJson(urlPath: urlPath, payload: payload, urlSession: self.urlSession, on: on)
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
            urlSession = JoliApi.sharedUrlSession.updated(configuration: self.urlSessionConfiguration)
            
            guard let host = self.baseUrl.http.host,
                var trustedHosts = (urlSession.delegate as? HttpsHook)?.trustedHosts,
                !trustedHosts.contains(host)
            else {
                return
            }
            
            trustedHosts.append(host)
        }
    }
    public var urlSession: URLSession = JoliApi.sharedUrlSession
    
    // MARK: - init
    public init(baseUrl: BaseUrl = .localhost, authToken: String? = nil, headers: HttpMethod.Headers = [:]){
        JoliApi.initLogger()
        
        self.urlSessionConfiguration = JoliApi.sharedUrlSession.configuration.withAuthHeader(authToken)
        self.urlSessionConfiguration.httpAdditionalHeaders!.merge(headers) { $1 }
        
        self.baseUrl = baseUrl
        let url = baseUrl.ws.appendingPathComponent("/ws")
        self.wsClient = WebSocketClient(url: url, headers: headers, trustedHosts: JoliApi.sharedUrlSessionDelegate.trustedHosts + [baseUrl.http.host!])
        
        //(ws: URL, http: URL)
        BASE_URL = baseUrl.rawValue
    }
    
    public enum Subject: String {
        case playerStateChanged = "PLAYER_STATE_CHANGED"
        case playerStateNowPlaying = "PLAYER_STATE_NOW_PLAYING"
        case activityFeed = "activity_feed"
        case dbUpdates = "database_updates"
        case queryTrackSearch = "QUERY_TRACK_SEARCH"
    }
    
    public func subscribe(subject: Subject, onMessage: @escaping WebSocketClient.ResponseCallback){
        let headers = self.urlSessionConfiguration.httpAdditionalHeaders as? HttpMethod.Headers
        self.wsClient.subscribe(subject.rawValue, headers: headers, handler: onMessage)
            .then() {
                logger.debug("[JoliApi#subscribe] subject=\(subject)")
            }
            .catch(){ error in
                logger.error("[wsSubscribe] error: \(error)")
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
    
    public func fetchSpotifyDevices(on: DispatchQueue? = nil) -> Promise<[Spotify.Device]> {
        let baseUrl = self.baseUrl.rawValue.http
        let queue = on ?? DispatchQueue.main
        return HttpMethod.Fetch.get(url: "/api/spotify/devices", dataType: [String: [Spotify.Device]].self, baseUrl: baseUrl, urlSession: self.urlSession, on: queue)
            .then(on: queue) { (dict) -> [Spotify.Device] in
                guard let devices = dict["devices"] else {
                    throw NetworkError.badResponse("expected key \"devices\" in response: \(dict)")
                }
                return devices
        }
    }
    
    public func fetchSpotifyUserProfile(on: DispatchQueue? = nil) -> Promise<Spotify.UserProfile> {
        return HttpMethod.Fetch.get(url: "/api/spotify/me", dataType: Spotify.UserProfile.self, baseUrl: self.baseUrl.rawValue.http, urlSession: self.urlSession, on: on)
    }
    
    @discardableResult
    public func delete<T>(_ model: T, on: DispatchQueue? = nil) -> Promise<T> where T: Persisted {
        return model.delete(baseUrl: self.baseUrl.rawValue.http, urlSession: urlSession, on: on)
    }
    
    // MARK: - Test
    @discardableResult
    public static func doTest() -> some Promise<Any?> {
        JoliApi.initLogger()
        
        //let urlSession = URLSession(configuration: .default)
        //let url = URL(string: "http://localhost:8080/api/db/musicrooms")!
        //debugPrint("names: \(Musicroom(name: "test").propertyValues())")
        let api = JoliApi(baseUrl: .localhost)
        let url: BaseUrl = api.baseUrl

        let res = [Track].fromString("""
        [
            {
                "id": 1,
                "created_by_id": 1,
                "created_at": "2019-10-01T09:18:56Z",
                "updated_at": "2019-10-01T09:18:56Z",
                "title": "Fever",
                "track_id": "5mN3xSyvCmFy1jkdA98IfS",
                "thumbnail_url": "https://i.scdn.co/image/ab67616d000048512e74362b470526cda9f124eb",
                "artist_name": "WizKid",
                "uri": "spotify:track:5mN3xSyvCmFy1jkdA98IfS"
            }
]
""")
        logger.debug("[QT] \(api)")
        return Promise(nil)
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
        
    }
    
    public static var sharedUrlSessionDelegate = HttpsHook(trustedHosts: [
       BaseUrl.homeLaptop.rawValue.http.host!,
       BaseUrl.homeDesktop.rawValue.http.host!,
       BaseUrl.mobileHotspot.rawValue.http.host!,
       BaseUrl.localhost.rawValue.http.host!,
       BaseUrl.dev.rawValue.http.host!,
       URL(string: "https://192.168.1.113:8080")!.host!,
       URL(string: "https://192.168.1.106:8080")!.host!
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

public extension JoliApi {
    
    func createMusicroom(name: String, details: String, on: DispatchQueue? = nil) -> Promise<Musicroom> {
        let musicroom = Musicroom.build([.name: name as AnyObject, .details: details as AnyObject])
        return musicroom.save(baseUrl: baseUrl.rawValue.http, urlSession: urlSession, on: on)
    }
    
    
    enum VersionResolveError: Error {
        case unrecognisedResponseType
        case noResponseReceived
        case missingVersionField
        case malformedString(String)
        case malformedBaseUrl(URL)
    }
    
    static func resolveServer(_ baseUrl: URL) -> Promise<Version> {
        
        logger.info("[resolveServer] baseUrl: \(baseUrl)")
        
        return Promise() { resolve, reject in
            
            guard let url = URL(string: "/status", relativeTo: baseUrl) else {
                return reject(VersionResolveError.malformedBaseUrl(baseUrl))
            }
            
            var req = URLRequest(url: url)
            req.httpMethod = "HEAD"
            
            let task = JoliApi.sharedUrlSession.dataTask(with: baseUrl) { (data, response, error) in
                guard error == nil else {
                    return reject(error!)
                }
                
                guard let resp = response as? HTTPURLResponse else {
                    return reject(response == nil ? VersionResolveError.noResponseReceived : VersionResolveError.unrecognisedResponseType)
                }
                
                guard let versionStr = resp.allHeaderFields["X-Server-Version"] as? String else {
                    return reject(VersionResolveError.missingVersionField)
                }
                
                guard let version = Version(versionStr) else {
                    return reject(VersionResolveError.malformedString(versionStr))
                }
                
                resolve(version)
            }
            
            task.resume()
        }
    }
    
}
