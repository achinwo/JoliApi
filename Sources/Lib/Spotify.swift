//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 11/12/2019.
//

import Foundation

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
        public var isActive: Bool
        public let isPrivateSession: Bool
        public let isRestricted: Bool
        public let name: String
        public let type: DeviceType
        public var volumePercent: Int
        
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
        
        public static func me(baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> Device {
            
            return try await HttpMethod.Fetch.get(url: "/api/this/device", dataType: Device.self, baseUrl: baseUrl, urlSession: urlSession)
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
    
    // MARK: - SearchResult
    public struct SearchResult: Codable {
        public let tracks: [Track]
        public let albums: [Album]
        public let artists: [Artist]
        public let playlists: [Playlist]
        public let shows: [Show]
        public let episodes: [Episode]
    }
    
    // MARK: - Show
    public struct Show: Codable {
        public let availableMarkets: [String]
        //let copyrights: [JSONAny]
        public let description: String
        public let explicit: Bool
        public let externalUrls: ExternalUrls
        public let href: String
        public let id: String
        public let images: [Image]
        public let isExternallyHosted: Bool
        public let languages: [String]
        public let mediaType, name, publisher: String
        public let totalEpisodes: Int
        public let type, uri: String
    }
    
    // MARK: - Episode
    public struct Episode: Codable {
        public let audioPreviewURL: String?
        public let description: String
        public let durationMS: Int?
        public let explicit: Bool
        public let externalUrls: ExternalUrls
        public let href: String
        public let id: String
        public let images: [Image]
        public let isExternallyHosted, isPlayable: Bool
        public let language: String
        public let languages: [String]
        public let name, releaseDate, releaseDatePrecision, type: String
        public let uri: String
    }
        
    // MARK: - CurrentlyPlayingContent
    public struct CurrentlyPlayingContent: Codable, Playable {
        
        public var releasedAt: Date? {
            return item.releasedAt
        }
        
        public var explicit: Bool {
            return item.explicit
        }
        
        public var duration: Int {
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
        public static func fetch(baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> CurrentlyPlayingContent? {
            return try await HttpMethod.Fetch.get(url: "/api/spotify/current-playing", dataType: CurrentlyPlayingContent?.self, baseUrl: baseUrl, urlSession: urlSession)
        }
        
    }
    
    // MARK: - Playlist
    public struct Playlist: Codable {
        public let collaborative: Bool
        public let description: String
        public let externalUrls: ExternalUrls
        public let href: String
        public let id: String
        public let images: [Image]
        public let name: String
        //let owner: Owner
        public let primaryColor: String?
        public let `public`: Bool?
        public let snapshotID: String?
        public let tracks: TracksInfo
        public let type, uri: String
        
        public struct TracksInfo: Codable {
            public let href: String
            public let total: Int
        }
        
    }

    // MARK: - Track
    public struct Track: Codable, Playable, DataConvertible {
        
        public var releasedAt: Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.date(from: self.album.releaseDate)
        }
        
        public var explicit: Bool
        
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
        
        public var duration: Int {
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
        public let images: [Image]?
        public let genres: [String]?
    }

    // MARK: - Image
    public struct Image: Codable {
        public let height: Int?
        public let url: String
        public let width: Int?
        
        public init(url: String, width: Int? = nil, height: Int? = nil){
            self.url = url
            self.width = width
            self.height = height
        }
        
    }
    
    public enum ErrorMessage: String {
        case invalidAccessToken = "Invalid access token"
    }
}
