//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 25/01/2020.
//

import Foundation


public enum ContentOffset {
    case uri(String)
    case position(Int)
    case both(String, Int)
    
    public var uri: String? {
        switch self {
        case .uri(let uri):
            return uri
        case .both(let uri, _):
            return uri
        default:
            return nil
        }
    }
    
    public var position: Int? {
        switch self {
        case .position(let pos):
            return pos
        case .both(_, let pos):
            return pos
        default:
            return nil
        }
    }
    
}

// MARK: - Playable
public protocol Playable {
    //associatedtype Track: Playable = Never
    
    var explicit: Bool { get }
    var title: String { get }
    var thumbnailUrl: String { get }
    var albumCoverUrl: String { get }
    var artistName: String { get }
    var uri: String { get }
    var isPlayable: Bool { get }
    var duration: Int { get }
    var releasedAt: Date? { get }
    
    func play(deviceId: String?, positionMs: Int?, offset: ContentOffset?, baseUrl: URL?, urlSession: URLSession?) async throws -> PlayState
}


extension Playable {
    
    public var releasedAt: Date? {
        return nil
    }
    
    public var isPlayable: Bool {
        return true
    }
    
    @discardableResult
    public static func playContent(_ uri: String, deviceId: String?, positionMs: Int? = nil, offset: ContentOffset? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> PlayState {
        var urlPath = URLComponents(string: "/api/spotify/play")!
        var queryItems: [URLQueryItem] = []
        
        if let deviceId = deviceId {
            queryItems.append(URLQueryItem(name: "deviceId", value: deviceId))
        }
        
        var payload: Json = [:]
        
        if let positionMs = positionMs {
            payload["position_ms"] = positionMs as AnyObject
        }
        
        if let offset = offset {
            
            var item: [String: AnyObject] = [:]
            
            switch offset {
                case .uri(let uri):
                    item["uri"] = uri as AnyObject
                case .position(let position):
                    item["position"] = position as AnyObject
                case .both(let uri, let position):
                    item["uri"] = uri as AnyObject
                    item["position"] = position as AnyObject
            }
            
            payload["offset"] = item as AnyObject
            payload["context_uri"] = uri as AnyObject
        } else {
            
            queryItems.append(URLQueryItem(name: "trackId", value: uri))
            payload["uris"] = [uri] as AnyObject
        }
        
        urlPath.queryItems = queryItems
        
        return try await HttpMethod.Fetch.post(url: urlPath, dataType: PlayState.self, payload: .json(payload), baseUrl: baseUrl, urlSession: urlSession)
    }
    
    @discardableResult
    public func play(deviceId: String?, positionMs: Int? = nil, offset: ContentOffset? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> PlayState {
        return try await Self.playContent(self.uri, deviceId: deviceId, positionMs: positionMs, offset: offset, baseUrl: baseUrl, urlSession: urlSession)
    }
    
}
