//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 30/10/2019.
//

import Foundation

extension Data {
    
    public var stringUtf8: String? {
        return String(data: self, encoding: .utf8)
    }
    
}

public typealias MultilineString = String


public extension String {
    func count(of needle: Character) -> Int {
        return reduce(0) {
            $1 == needle ? $0 + 1 : $0
        }
    }
}

@available(iOS, deprecated: 15.0, message: "Use the built-in API instead")
public extension URLSession {
    
    func data(from url: URLRequest) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }
                
                continuation.resume(returning: (data, response))
            }
            
            task.resume()
        }
    }
    
}

public extension URL {
    
    init(staticString: StaticString){
        self.init(string: "\(staticString)")!
    }
    
    init(social: SocialLink){
        self = social.url
    }
    
    static func fromString(_ string:  String?) -> URL? {
        guard let string = string else { return nil }
        return Self.init(string: string)
    }
}

public enum SocialLink: CustomStringConvertible {
    
    case instagramUser(String)
    case instagramHashtag(String)
    case youtubeChannel(String)
    case youtubeUser(String)
    case twitterUser(String)
    
    static func normalizeName(_ nameOrUrl:  String) -> String {
        return URL(string: nameOrUrl)?.lastPathComponent ?? nameOrUrl
    }
    
    public var normalizedName: String {
        switch self {
            case .instagramUser(let base), .instagramHashtag(let base), .youtubeChannel(let base), .youtubeUser(let base), .twitterUser(let base):
                return Self.normalizeName(base)
        }
    }
    
    public var description: String {
        switch self {
            case .instagramUser(let base):
                return "@\(Self.normalizeName(base))"
            case .instagramHashtag(let base):
                return "#\(Self.normalizeName(base))"
            case .youtubeChannel(let base), .youtubeUser(let base), .twitterUser(let base):
                return Self.normalizeName(base)
        }
    }
    
    public var url: URL {
        switch self {
            case .instagramUser(_), .twitterUser(_):
                return baseUrl.appendingPathComponent(self.normalizedName, isDirectory: true)
            case .instagramHashtag(_):
                return baseUrl.appendingPathComponent("/explore/tags/\(self.normalizedName)", isDirectory: true)
            case .youtubeChannel(_):
                return baseUrl.appendingPathComponent("/channel/\(self.normalizedName)")
            case .youtubeUser(_):
                return baseUrl.appendingPathComponent("/user/\(self.normalizedName)")
        }
    }
    
    public static var urls: (instagram: URL, youtube: URL, twitter: URL) {
        return (
            instagram: URL(staticString: "https://www.instagram.com"),
            youtube: URL(staticString: "https://www.youtube.com"),
            twitter: URL(staticString: "https://twitter.com")
        )
    }
    
    public var baseUrl: URL {
        switch self {
            case .instagramUser(_), .instagramHashtag(_):
                return Self.urls.instagram
            case .youtubeChannel(_), .youtubeUser(_):
                return Self.urls.youtube
            case .twitterUser(_):
                return Self.urls.twitter
        }
    }
}

public class HttpsHook: NSObject, URLSessionDelegate {
    
    static let validIpAddressRegex = "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
    
    
    public let trustedHosts: [String]
    
    public init(trustedHosts: [String]) {
        self.trustedHosts = trustedHosts
    }
    
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        let allowConnect = {
                //logger.debug("[HttpsHook] protectionSpace: \(challenge.protectionSpace) - \(challenge.protectionSpace.host)")
            let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
                //print("[HttpsHook] replacing: \(credential)")
            
            challenge.sender?.use(credential, for: challenge)
            completionHandler(URLSession.AuthChallengeDisposition.useCredential, credential)
        }
        
        let host = challenge.protectionSpace.host
        
        guard host.range(of: HttpsHook.validIpAddressRegex, options: .regularExpression, range: nil, locale: nil) != nil else {
            allowConnect()
            return
        }
        
        let trustedHostArray: [String] = trustedHosts

        //logger.debug("[HttpsHook] trusted: \(trustedHostArray) - \(challenge.protectionSpace.authenticationMethod)")
//        if Utils.getEnviroment() == Constants.Environment.Production.rawValue {
//            trustedHostArray = Constants.TRUSTED_HOSTS.Production
//        } else {
//            trustedHostArray = Constants.TRUSTED_HOSTS.Develop
//        }
        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
              trustedHostArray.contains(challenge.protectionSpace.host) else {
            return
        }

        allowConnect()
    }
    
}

public extension Result {
    var success: Success? {
        switch self {
            case .success(let success):
                return success
            default:
                return nil
        }
    }
    
    var error: Failure? {
        switch self {
            case .failure(let error):
                return error
            default:
                return nil
        }
    }
}

public extension Result where Success == URLSessionWebSocketTask.Message {
    
    var successTuple: (string: String?, data: Data?) {
        switch self {
            case .success(let success):
                switch success {
                    case .string(let val):
                        return (string: val, data: nil)
                    case .data(let data):
                        return (string: nil, data: data)
                    @unknown default:
                        fatalError()
                }
            default:
                return (string: nil, data: nil)
        }
    }
    
    var successString: String? {
        return successTuple.string
    }
    
    var successData: Data? {
        return successTuple.data ?? successString?.data(using: .utf8)
    }
    
    var successJson: Json? {
        guard let data = successData else  { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: []) as? Json
    }
    
    var successResponse: WebSocketClient.Response? {
        guard let data = successJson,
              let topicUrl = data["topic"] as? String,
              let url = URLComponents(string: topicUrl),
              let body = data["data"] as? Json
        else { return nil }
        
        let subjectQ = url.queryItems?.first(where: { $0.name == "subject" })
        
        return WebSocketClient.Response(topic: url.path, subject: subjectQ?.value, payload: body)
    }
}


extension URLSession {
    
    public func updated(configuration: URLSessionConfiguration, delegate: URLSessionDelegate? = nil, delegateQueue: OperationQueue? = nil) -> URLSession {
        return URLSession.init(configuration: configuration,
                               delegate: delegate ?? self.delegate, delegateQueue: delegateQueue ?? self.delegateQueue)
    }
    
}

public struct Auth: Codable, Hashable {
    public var session: Session
    public var user: User
}

public struct ErrorMessage: Codable, Error, Equatable {
    public let status: Int
    public let message: String?
    public let type: String?
    public let label: String?
}

public struct Response<T: Codable>: Codable {
    public let data: T?
    public let error: ErrorMessage?
}

public enum NetworkError: Error {
    case invalidUrl(URLComponents, URL)
    case badUrl(UrlConvertible, URL?)
    case invalidUrlPath(String)
    case badRequest(String)
    case badResponse(String)
    case errorMessage(ErrorMessage?)
    case deserialization(String?, URLResponse?, Error)
}

public typealias Json = [String: AnyObject]

extension Json {
    
    static func santized(_ json: Json) throws -> Json {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"

        let items: [Json.Element] = json.map() { item in
            let value = item.value
            switch value {
            case let date as Date:
                return (item.key, df.string(from: date) as AnyObject)
            default:
                return (item.key, item.value)
            }
        }
        return Json(uniqueKeysWithValues: items)
    }
    
    public func toData(writingOptions: JSONSerialization.WritingOptions = []) throws -> Data {
        return try JSONSerialization.data(withJSONObject: try Self.santized(self), options: writingOptions)
    }
    
}

public enum HttpBody {
    
    case data(Data)
    case multipart(Json)
    case json(Json)
    case dbModel(DataConvertible)
    case jsons([Json])
    
    public func toData() throws -> Data {
        switch self {
        case .data(let data):
            return data
        case .multipart(let json):
            return try json.toData()
        case .json(let json):
            return try json.toData()
        case .dbModel(let model):
            return try model.toData(outputFormatting: [])
        case .jsons(let jsons):
            var santized: [Json] = []
            for json in jsons {
                santized.append(try Json.santized(json))
            }
            return try JSONSerialization.data(withJSONObject: santized, options:.prettyPrinted)
        }
    }
}

public protocol UrlConvertible {
    func url(relativeTo: URL?) -> URL?
}

extension String: UrlConvertible {
    
    public func url(relativeTo: URL? = nil) -> URL? {
        return URL(string: self, relativeTo: relativeTo)
    }
    
}

extension URLComponents: UrlConvertible {
    
}

extension URL: UrlConvertible {
    
    public func url(relativeTo: URL? = nil) -> URL? {
        guard let rel = relativeTo else {
            return self
        }
        
        return URLComponents(string: self.path)?.url(relativeTo: rel)
    }
    
}

public enum HttpMethod: String {
    
    public typealias Headers = [String: String]
    
    public static var verbose = false
    
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case head = "HEAD"
    
    public enum Fetch {
        
        public static func post<T: Codable>(url: UrlConvertible, dataType: T.Type, payload: HttpBody? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> T {
            return try await HttpMethod.Fetch.execute(method: .post, url: url, dataType: dataType, payload: payload, baseUrl: baseUrl, urlSession: urlSession)
        }
        
        public static func delete<T: Codable>(url: UrlConvertible, dataType: T.Type, payload: HttpBody? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> T {
            return try await HttpMethod.Fetch.execute(method: .delete, url: url, dataType: dataType, payload: payload, baseUrl: baseUrl, urlSession: urlSession)
        }
        
        public static func get<T: Codable>(url: UrlConvertible, dataType: T.Type, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> T {
            return try await HttpMethod.Fetch.execute(method: .get, url: url, dataType: dataType, payload: nil, baseUrl: baseUrl, urlSession: urlSession)
        }
        
        public static func head<T: Codable>(url: UrlConvertible, dataType: T.Type, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> T {
            return try await HttpMethod.Fetch.execute(method: .head, url: url, dataType: dataType, payload: nil, baseUrl: baseUrl, urlSession: urlSession)
        }
        
        public static func execute<T: Codable>(method: HttpMethod, url urlLike: UrlConvertible, dataType: T.Type, payload: HttpBody? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> T {
            
            let baseUrl = baseUrl == nil ? (urlLike as? URL)?.baseURL ?? LocalhostApi.default.baseUrlHttp : baseUrl
            
            guard let url = urlLike.url(relativeTo: baseUrl) else {
                throw NetworkError.badUrl(urlLike, baseUrl)
            }
        
            return try await withCheckedThrowingContinuation { continuation in
                
                let callback = { (data: Data?, resp: URLResponse?, error: Error?) -> Void in
                    
                    guard let data = data else {
                        return continuation.resume(throwing: error ?? URLError(.badServerResponse))
                    }

                    do {
                        let respObj = try Session.jsonDecoder().decode(Response<T>.self, from: data)
                        
                        guard let respData = respObj.data else {
                            let error = respObj.error != nil ?
                                NetworkError.errorMessage(respObj.error!) :
                                NetworkError.badResponse(data.stringUtf8 ?? "<<Data to string failed>>")
                            
                            return continuation.resume(throwing: error)
                        }
                        
                        continuation.resume(returning: respData)
                    } catch {
                        continuation.resume(throwing: NetworkError.deserialization(data.stringUtf8, resp, error))
                    }
                }
                
                let urlSession = urlSession ?? LocalhostApi.default.urlSession
                
                var request = URLRequest(url: url)
                request.httpMethod = method.rawValue
                
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
                
                let task: URLSessionTask
                switch method {
                case .post, .put:
                        
                    guard let payloadData = try? (payload ?? .json([:])).toData() else {
                            return continuation.resume(throwing: NetworkError.badRequest("bad payload for post request: \(String(describing: payload))"))
                        }
                        
                        task = urlSession.uploadTask(with: request, from: payloadData, completionHandler: callback)
                    case .get, .delete, .head:
                        task = urlSession.dataTask(with: request, completionHandler: callback)
                }
                task.resume()
            }
        }
        
    }
    
    public func fetchJson(urlPath: URLComponents, payload: Json, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> Json {
        return try await fetchJson(urlPath: urlPath,
                         payload: .json(payload), baseUrl: baseUrl,
                         urlSession: urlSession)
    }
    
    public func fetchJson(urlPath: URLComponents, payload: HttpBody, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws ->  Json {
        let baseUrl = baseUrl ?? Track.baseUrl.http
        
        guard let url = urlPath.url(relativeTo: baseUrl) else {
            throw NetworkError.invalidUrl(urlPath, baseUrl)
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            
            let callback = { (data: Data?, resp: URLResponse?, error: Error?) -> Void in
                
                guard let data = data else {
                    return continuation.resume(throwing: error ?? URLError(.badServerResponse))
                }
                
                do {

                    let respObj = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    continuation.resume(returning: respObj as! Json)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
            
            guard let payloadData = try? payload.toData() else {
                return continuation.resume(throwing: NetworkError.badRequest("bad paylod for post request: \(String(describing: payload))"))
            }
            
            let urlSession = urlSession ?? URLSession.shared
            
            var request = URLRequest(url: url)
            request.httpMethod = self.rawValue
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
            
            let task: URLSessionTask
            
            switch self {
            case .post, .put:
                task = urlSession.uploadTask(with: request, from: payloadData, completionHandler: callback)
                case .get, .delete, .head:
                task = urlSession.dataTask(with: request, completionHandler: callback)
            }
            
            task.resume()
        }
    }
}


