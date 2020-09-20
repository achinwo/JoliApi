//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 11/12/2019.
//

import Foundation
import  Promises

public enum Spotify {
    
    public enum DeviceType: String, Codable {
        /// https://developer.spotify.com/documentation/web-api/reference/player/get-a-users-available-devices/#device-types
        
        case computer = "Computer"
        case tablet = "Tablet"
        case smartphone = "Smartphone"
        case speaker = "Speaker"
        case tv = "TV"
        case avr = "AVR"
        case stb = "STB"
        case audioDongle = "AudioDongle"
        case gameConsole = "GameConsole"
        case castVideo = "CastVideo"
        case castAudio = "CastAudio"
        case automobile = "Automobile"
        case unknown = "Unknown"
    }
    
    public struct Device: Codable, Identifiable, Hashable, DataConvertible {
        public let id: String
        public let isActive: Bool
        public let isPrivateSession: Bool
        public let isRestricted: Bool
        public let name: String
        public let type: DeviceType
        public let volumePercent: Int
        
        public init(name: String, type: DeviceType, isActive: Bool, id: String, isPrivateSession: Bool = false, isRestricted: Bool = false, volumePercent: Int = 30) {
            self.id = id
            self.isActive = isActive
            self.isPrivateSession = isPrivateSession
            self.isRestricted = isRestricted
            self.name = name
            self.type = type
            self.volumePercent = volumePercent
        }
        
        public func toData(outputFormatting: JSONEncoder.OutputFormatting? = nil) throws -> Data {
            return try Musicroom.jsonEncoder(outputFormatting: outputFormatting ?? []).encode(self)
        }
        
        public static func me(baseUrl: URL? = nil, urlSession: URLSession? = nil) -> Promise<Device>{
            
            return HttpMethod.Fetch.get(url: "/api/this/device", dataType: Device.self, baseUrl: baseUrl, urlSession: urlSession)
        }
    }
    
    public struct UserProfile: Codable {
        
        public let birthdate: String
        public let country: String
        public let displayName: String
        public let email: String
        public let explicitContent: [String: Bool]
        public let externalUrls: [String: String]
//        public let followers: [String: Codable]
        public let href: String
        public let id: String
//        public let images: [[String: Codable]]
        public let product: String
        public let type: String
        public let uri: String
        
        public var isPremium: Bool {
            return product == "premium"
        }
        
    }
    // MARK: - CurrentlyPlayingContext
    public struct CurrentlyPlayingContext: Codable {
        public let externalUrls: ExternalUrls
        public let href: String
        public let type: String
        public let uri: String
    }
    
    public struct SearchResult: Codable {
        public let tracks: [Track]
        public let albums: [Album]
        public let artists: [Artist]
    }
        
    // MARK: - CurrentlyPlayingContent
    public struct CurrentlyPlayingContent: Codable, Playable {
        
        public var explicit: Bool? {
            return item.explicit
        }
        
        public var duration: Int? {
            return item.durationMs
        }
        
        public var title: String {
            return item.title
        }
        
        public var thumbnailUrl: String {
            return item.thumbnailUrl
        }
        
        public var albumCoverUrl: String {
            return item.albumCoverUrl
        }
        
        public var artistName: String {
            return item.artistName
        }
        
        public var uri: String {
            return item.uri
        }
        
        public var context: CurrentlyPlayingContext? = nil
        public let timestamp: Int
        public let progressMs: Int
        public let item: Track
        public let currentlyPlayingType: String
        public let actions: Actions
        public var isPlaying: Bool

        // MARK: - Actions
        public struct Actions: Codable {
            public let disallows: Disallows
        }

        // MARK: - Disallows
        public struct Disallows: Codable {
            public let skippingPrev: Bool?
            public let togglingRepeatTrack: Bool?
        }

        public static func fromData(_ data: Data) throws -> CurrentlyPlayingContent? {
            do{
                return try Musicroom.jsonDecoder().decode(CurrentlyPlayingContent.self, from: data)
            }catch{
                debugPrint("[CurrentlyPlayingContent] failed to decode: \(error)")
            }
            return nil
        }
        
        @discardableResult
        public static func fetch(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<CurrentlyPlayingContent?> {
            return HttpMethod.Fetch.get(url: "/api/spotify/current-playing", dataType: CurrentlyPlayingContent?.self, baseUrl: baseUrl, urlSession: urlSession, on: on)
        }
        
    }

    // MARK: - Track
    public struct Track: Codable, Playable, DataConvertible {
        
        public var explicit: Bool?
        
        public var title: String {
            return name
        }
        
        public var artistName: String {
            return artists.first!.name
        }
        
        public var thumbnailUrl: String {
            return album.images.last!.url
        }
        
        public var albumCoverUrl: String {
            return album.images.first!.url
        }
        
        public var duration: Int? {
            return self.durationMs
        }
        
        public let album: Album
        public let artists: [Artist]
        public let availableMarkets: [String]
        public let discNumber: Int?
        public let durationMs: Int
        public let externalIds: ExternalIds
        public let externalUrls: ExternalUrls
        public let href: String
        public let id: String
        public let isLocal: Bool
        public let name: String
        public let popularity: Int
        public let previewUrl: String?
        public let trackNumber: Int?
        public let type: String
        public let uri: String

        // MARK: - ExternalIDS
        public struct ExternalIds: Codable {
            public let isrc: String?
        }
        
    }
    
    // MARK: - ExternalUrls
    public struct ExternalUrls: Codable {
        public let spotify: String
    }

    // MARK: - Album
    public struct Album: Codable {
        public let albumType: String
        public let artists: [Artist]
        public let availableMarkets: [String]
        public let externalUrls: ExternalUrls
        public let href: String
        public let id: String
        public let images: [Image]
        public let name: String
        public let releaseDate: String
        public let releaseDatePrecision: String
        public let totalTracks: Int
        public let type: String
        public let uri: String
    }
    
    // MARK: Recommendation
    public struct Recommendation: Codable {
        public let tracks: [Track]
    }

    // MARK: - Artist
    public struct Artist: Codable {
        public let externalUrls: ExternalUrls
        public let href: String
        public let id: String
        public let name: String
        public let type: String
        public let uri: String
    }

    // MARK: - Image
    public struct Image: Codable {
        public let height: Int
        public let url: String
        public let width: Int
    }
    
    public enum ErrorMessage: String {
        case invalidAccessToken = "Invalid access token"
    }
}
