//
//  main.swift
//  
//
//  Created by Anthony Chinwo on 05/12/2019.
//

import Foundation
import Commander
import JSONSchema
import SwiftSyntax
import JoliCore
import JoliApi
import Promises
import UIImageColors

// swift build -c release --package-path "${JOLI}JoliApi" && cp -f "${JOLI}JoliApi/.build/release/joli" /usr/local/bin/joli


let TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvbGlAam9saW1jLmFwcCIsImNyZWF0ZWRBdCI6IjIwMjAtMDgtMjJUMTM6NDQ6NTUuODY2WiIsImV4cGlyZXNJbiI6MTQ0MDAwMH0.OhxodQ0Zl0E_k_Su8CDwSB2scqteqfmyfUSMHwlfN00"


func downloadImage(_ url: URL, urlSession: URLSession, on: DispatchQueue? = nil) -> Promise<UIImage> {
    print("Download Started")
    
    return Promise() { (resolve, reject) in
        let task = urlSession.dataTask(with: url) { data, response, error in
            
            guard let data = data,
                  let image = UIImage(data: data),
                  error == nil else {
                print("Download errored: \(error)\n")
                reject(error!)
                return
            }
            
            print("Download Finished")
            resolve(image)
        }
        task.resume()
    }
}



public struct TracksResponse: Codable, DataConvertible {
    var tracks: [Spotify.Track]
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

func enrichTracks(_ api: JoliApi) -> Promise<[Track?]> {
    api.urlSessionConfiguration = api.urlSession.configuration.withAuthHeader(TOKEN)
    
    debugPrint("[enrichTracks] apiSession: \(api.urlSession.configuration.httpAdditionalHeaders)")
    
    return Track.all(limit: 10, baseUrl: api.baseUrlHttp, urlSession: api.urlSession, on: .main)
        .catch() { error in
            print("[Track.all] error: \(error)")
        }
        .then() { tracks -> Promise<[Track?]> in
            let dict = Dictionary(uniqueKeysWithValues: tracks.map{ ($0.trackId, $0) })
            
            print("[enrichTracks] all \(tracks.count) fetched. dict \(dict.count)")
            
            var promises: [Promise<[Spotify.Track]>] = []
            
            for chunk in tracks.chunked(into: 40) {
                let ids = chunk.map() { $0.trackId }.joined(separator: ",")
                
                promises.append(HttpMethod.Fetch.get(url: "/api/spotify/tracks?ids=\(ids)",
                                                     dataType: TracksResponse.self,
                                                     baseUrl: api.baseUrlHttp,
                                                     urlSession: api.urlSession,
                                                     on: .main)
                                    .then() { $0.tracks })
            }
            
            
            return Promises.all(promises)
                .then() { $0.flatMap() { $0 } }
                .then() { (res: [Spotify.Track]) -> Promise<[Track?]> in
                    
                    var proms: [Promise<Track?>] = []
                    
                    for sTrack in res {
                        guard let track: Track = dict[sTrack.id] else {
                            continue
                        }

                        var builder = track.builder()
                        let url = URL(string: sTrack.album.images[0].url)!
                        
                        let prom = downloadImage(url, urlSession: api.urlSession, on: .main)
                            .then() { image -> Promise<Track?> in
                                
                                guard let colors = image.getColors() else {
                                    print("Error: unable to resolve colors: \(url)")
                                    return Promise<Track?>(nil)
                                }

                                builder.colorBackground = colors.background.hexString
                                builder.colorPrimary = colors.primary.hexString
                                builder.colorSecondary = colors.secondary.hexString
                                builder.colorDetail = colors.detail.hexString
                                
                                return builder.save(baseUrl: api.baseUrlHttp,
                                                    urlSession: api.urlSession,
                                                    on: .main)
                                    .catch() { err in
                                        debugPrint("[Color#\(track.name)] error: \(err)")
                                    }
                                    .then() { $0 }
                            }
                        proms.append(prom)
                    }
                    
                    return Promises.all(proms)
                }
        }
    
}


let main = command(
    Argument<String>("schemaUrl", description: "Your name")
) { (schemaUrl: String) in
    print("Reading file \(schemaUrl) [Banger66]")
    
    //    let comp = URLComponents(string: "/api/db/schemas")!
    //    let baseUrl = URL(string: "https://localhost:8080")!
    
    JoliApi.initLogger()
    let api = JoliApi(baseUrl: .localhost, authToken: TOKEN)
    
    
    //    let delegate = HttpsHook(trustedHosts: ["localhost"])
    //    let config = URLSession.shared.configuration.withAuthHeader(TOKEN)
    //    let urlSess = URLSession.shared.updated(configuration: config, delegate: delegate)
    let prom2 = enrichTracks(api)
        .catch() { error in
            debugPrint("[enrichTracks] error: \(error)")
        }
        .then() { tracks in
            for track in tracks {
                print("[\(track?.name)]")
            }
        }
    
    //let users = User.all(baseUrl: api.baseUrlHttp, urlSession: api.urlSession, on: .main)
    
    Promises.all([prom2])
        .catch() { error in
            print("Error: \(error)")
            exit(EXIT_FAILURE)
        }
        .then() { _ in
            exit(EXIT_SUCCESS)
        }
    
    dispatchMain()
}

main.run()
