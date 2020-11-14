//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 30/10/2019.
//

import Foundation
import Promises

extension Data {
    
    public var stringUtf8: String? {
        return String(data: self, encoding: .utf8)
    }
    
}

public class HttpsHook: NSObject, URLSessionDelegate {
    
    public let trustedHosts: [String]
    
    public init(trustedHosts: [String]) {
        self.trustedHosts = trustedHosts
    }
    
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

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

        //logger.debug("[HttpsHook] protectionSpace: \(challenge.protectionSpace) - \(challenge.protectionSpace.host)")
        let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        //print("[HttpsHook] replacing: \(credential)")

        challenge.sender?.use(credential, for: challenge)
        completionHandler(URLSession.AuthChallengeDisposition.useCredential, credential)
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

public struct ErrorMessage: Codable, Error {
    public let status: Int
    public let message: String?
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
    case errorMessage(ErrorMessage)
    case deserialization(String?, URLResponse?, Error)
}

public typealias Json = [String: AnyObject]

extension Json {
    
    public func toData(writingOptions: JSONSerialization.WritingOptions = []) throws -> Data {
        return try JSONSerialization.data(withJSONObject: self, options: writingOptions)
    }
    
}

public enum HttpBody {
    
    case multipart(Json)
    case json(Json)
    case dbModel(DataConvertible)
    case jsons([Json])
    
    public func toData() throws -> Data {
        switch self {
        case .multipart(let json):
            return try json.toData()
        case .json(let json):
            return try json.toData()
        case .dbModel(let model):
            return try model.toData(outputFormatting: [])
        case .jsons(let jsons):
            return try JSONSerialization.data(withJSONObject: jsons, options:.prettyPrinted)
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
        
        public static func post<T: Codable>(url: UrlConvertible, dataType: T.Type, payload: HttpBody? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil)  -> Promise<T> {
            return HttpMethod.Fetch.execute(method: .post, url: url, dataType: dataType, payload: payload, baseUrl: baseUrl, urlSession: urlSession, on: on)
        }
        
        public static func delete<T: Codable>(url: UrlConvertible, dataType: T.Type, payload: HttpBody? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil)  -> Promise<T> {
            return HttpMethod.Fetch.execute(method: .delete, url: url, dataType: dataType, payload: payload, baseUrl: baseUrl, urlSession: urlSession, on: on)
        }
        
        public static func get<T: Codable>(url: UrlConvertible, dataType: T.Type, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil)  -> Promise<T> {
            return HttpMethod.Fetch.execute(method: .get, url: url, dataType: dataType, payload: nil, baseUrl: baseUrl, urlSession: urlSession, on: on)
        }
        
        public static func head<T: Codable>(url: UrlConvertible, dataType: T.Type, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil)  -> Promise<T> {
            return HttpMethod.Fetch.execute(method: .head, url: url, dataType: dataType, payload: nil, baseUrl: baseUrl, urlSession: urlSession, on: on)
        }
        
        public static func execute<T: Codable>(method: HttpMethod, url urlLike: UrlConvertible, dataType: T.Type, payload: HttpBody? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<T> {
            
            let baseUrl = baseUrl == nil ? (urlLike as? URL)?.baseURL ?? LocalhostApi.default.baseUrlHttp : baseUrl
            
            guard let url = urlLike.url(relativeTo: baseUrl) else {
                return Promise(NetworkError.badUrl(urlLike, baseUrl))
            }
        
            let queue = on ?? DispatchQueue.global(qos: .default)
            //debugPrint("[fetch] \(url) - \(payload)")
            return Promise<T>(on: queue) { (resolve, reject) in
                
                let callback = { (data: Data?, resp: URLResponse?, error: Error?) -> Void in
                    
                    guard let data = data else {
                        return reject(error!)
                    }

                    do {
                        let respObj = try Session.jsonDecoder().decode(Response<T>.self, from: data)
                        
                        guard let respData = respObj.data else {
                            let error = respObj.error != nil ?
                                NetworkError.errorMessage(respObj.error!) :
                                NetworkError.badResponse(data.stringUtf8 ?? "<<Data to string failed>>")
                            
                            return reject(error)
                        }
                        
                        resolve(respData)
                    } catch {
                        reject(NetworkError.deserialization(data.stringUtf8, resp, error))
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
                            return reject(NetworkError.badRequest("bad payload for post request: \(String(describing: payload))"))
                        }
                        
                        task = urlSession.uploadTask(with: request, from: payloadData, completionHandler: callback)
                    case .get, .delete, .head:
                        task = urlSession.dataTask(with: request, completionHandler: callback)
                }
                task.resume()
            }
        }
        
    }
    
    public func fetchJson(urlPath: URLComponents, payload: Json, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) ->  Promise<Json> {
        return fetchJson(urlPath: urlPath,
                         payload: .json(payload), baseUrl: baseUrl,
                         urlSession: urlSession,
                         on: on)
    }
    
    public func fetchJson(urlPath: URLComponents, payload: HttpBody, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) ->  Promise<Json> {
        
        let queue = on ?? DispatchQueue.global(qos: .default)
        let baseUrl = baseUrl ?? Track.baseUrl.http
        
        guard let url = urlPath.url(relativeTo: baseUrl) else {
            return Promise(NetworkError.invalidUrl(urlPath, baseUrl))
        }
        
        return Promise<Json>(on: queue) { (resolve, reject) in
            
            let callback = { (data: Data?, resp: URLResponse?, error: Error?) -> Void in
                
                guard let data = data else {
                    return reject(error!)
                }
                
                do {

                    let respObj = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    resolve(respObj as! Json)
                } catch {
                    reject(error)
                }
            }
            
            guard let payloadData = try? payload.toData() else {
                return reject(NetworkError.badRequest("bad paylod for post request: \(String(describing: payload))"))
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


