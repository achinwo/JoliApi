//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 25/01/2020.
//

import Foundation
import Promises

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
    func play(deviceId: String?, positionMs: Int?, baseUrl: URL?, urlSession: URLSession?, on: DispatchQueue?) -> Promise<PlayState>
}


extension Playable {
    
    public var isPlayable: Bool {
        return true
    }
    
    @discardableResult
    public func play(deviceId: String?, positionMs: Int? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<PlayState> {
            
        var urlPath = URLComponents(string: "/api/spotify/play")!
        urlPath.queryItems = [
            URLQueryItem(name: "trackId", value: self.uri),
        ]
        
        if let deviceId = deviceId {
            urlPath.queryItems!.append(URLQueryItem(name: "deviceId", value: deviceId))
        }
        
        var payload: Json = [:]
        
        if let positionMs = positionMs {
            payload["position_ms"] = positionMs as AnyObject
        }
        
        return HttpMethod.Fetch.post(url: urlPath, dataType: PlayState.self, payload: .json(payload), baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
}
