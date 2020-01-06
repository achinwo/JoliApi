//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 30/10/2019.
//

import Foundation
import Promises


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


extension URLSession {
    
    public func updated(configuration: URLSessionConfiguration, delegate: URLSessionDelegate? = nil, delegateQueue: OperationQueue? = nil) -> URLSession {
        return URLSession.init(configuration: configuration,
                               delegate: delegate ?? self.delegate, delegateQueue: delegateQueue ?? self.delegateQueue)
    }
    
}

public struct Auth: Codable {
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
    
    case json(Json)
    case dbModel(DataConvertible)
    
    public func toData() throws -> Data {
        switch self {
        case .json(let json):
            return try json.toData()
        case .dbModel(let model):
            return try model.toData(outputFormatting: [])
        }
    }
}

public enum HttpMethod: String {
    
    public typealias Headers = [String: String]
    
    public static var verbose = false
    
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    
    public func fetch<T: Codable>(urlString: String, dataType: T.Type, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<T> {
        let baseUrl = baseUrl ?? Track.baseUrl.http
        return self.fetch(urlString: urlString, dataType: dataType, payload: nil, baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public func fetch<T: Codable>(urlString: String, dataType: T.Type, payload: HttpBody?, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<T> {
        guard let url = URLComponents(string: urlString) else {
            return Promise(NetworkError.invalidUrlPath(urlString))
        }
        
        let baseUrl = baseUrl ?? Track.baseUrl.http
        return self.fetch(urlPath: url, dataType: dataType, payload: payload, baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public func fetch<T: Codable>(urlPath: URLComponents, dataType: T.Type, payload: HttpBody? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<T> {
        let baseUrl = baseUrl ?? Track.baseUrl.http
        
        guard let url = urlPath.url(relativeTo: baseUrl) else {
            return Promise(NetworkError.invalidUrl(urlPath, baseUrl))
        }
        
        return self.fetch(url: url, dataType: dataType, payload: payload, urlSession: urlSession, on: on)
    }
    
    public func fetch<T: Codable>(url: URL, dataType: T.Type, payload: HttpBody? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<T> {
        
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
            
            let urlSession = urlSession ?? URLSession.shared
            
            var request = URLRequest(url: url)
            request.httpMethod = self.rawValue
            
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
            
            let task: URLSessionTask
            switch self {
            case .post, .put:
                    
                guard let payloadData = try? (payload ?? .json([:])).toData() else {
                        return reject(NetworkError.badRequest("bad payload for post request: \(String(describing: payload))"))
                    }
                    
                    task = urlSession.uploadTask(with: request, from: payloadData, completionHandler: callback)
            case .get, .delete:
                    task = urlSession.dataTask(with: request, completionHandler: callback)
            }
            task.resume()
        }
    }
    
    public func fetchJson(urlPath: URLComponents, payload: Json, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) ->  Promise<Json> {
        
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
            
            guard let payloadData = try? JSONSerialization.data(withJSONObject: payload, options: []) else {
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
            case .get, .delete:
                task = urlSession.dataTask(with: request, completionHandler: callback)
            }
            
            task.resume()
        }
    }
}

extension Data {
    
    public var stringUtf8: String? {
        return String(data: self, encoding: .utf8)
    }
    
}
