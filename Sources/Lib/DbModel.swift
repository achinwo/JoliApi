// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let authToken = try? newJSONDecoder().decode(AuthToken.self, from: jsonData)
//   let reward = try? newJSONDecoder().decode(Reward.self, from: jsonData)
//   let mealChoice = try? newJSONDecoder().decode(MealChoice.self, from: jsonData)
//   let user = try? newJSONDecoder().decode(User.self, from: jsonData)
//   let musicroom = try? newJSONDecoder().decode(Musicroom.self, from: jsonData)
//   let artist = try? newJSONDecoder().decode(Artist.self, from: jsonData)
//   let roomTrack = try? newJSONDecoder().decode(RoomTrack.self, from: jsonData)
//   let track = try? newJSONDecoder().decode(Track.self, from: jsonData)
//   let session = try? newJSONDecoder().decode(Session.self, from: jsonData)
//   let queuedTrack = try? newJSONDecoder().decode(QueuedTrack.self, from: jsonData)
//   let queuedTrackVote = try? newJSONDecoder().decode(QueuedTrackVote.self, from: jsonData)
//   let roomMembership = try? newJSONDecoder().decode(RoomMembership.self, from: jsonData)
//   let device = try? newJSONDecoder().decode(Device.self, from: jsonData)
//   let playState = try? newJSONDecoder().decode(PlayState.self, from: jsonData)
//   let logEntry = try? newJSONDecoder().decode(LogEntry.self, from: jsonData)
//   let entitlement = try? newJSONDecoder().decode(Entitlement.self, from: jsonData)
//   let userNotification = try? newJSONDecoder().decode(UserNotification.self, from: jsonData)
//   let genre = try? newJSONDecoder().decode(Genre.self, from: jsonData)
//   let food = try? newJSONDecoder().decode(Food.self, from: jsonData)
//   let drink = try? newJSONDecoder().decode(Drink.self, from: jsonData)
//   let event = try? newJSONDecoder().decode(Event.self, from: jsonData)

import Foundation

/// AuthToken
// MARK: - AuthToken
public struct AuthToken: Persisted, DataConvertible {
    public var accessToken: String
    public var country: String
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var displayName: String
    public var email: String
    public var expiresIn: Int
    public var id: Int
    public var parentId: Int?
    public var product: String
    public var refreshToken: String
    public var roomId: Int?
    public var scope: String
    public var spotifyVersion: String?
    public var tokenType: String
    public var updatedAt: Date
    public var updatedById: Int
    public var userName: String

    public enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case country = "country"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case displayName = "displayName"
        case email = "email"
        case expiresIn = "expiresIn"
        case id = "id"
        case parentId = "parentId"
        case product = "product"
        case refreshToken = "refreshToken"
        case roomId = "roomId"
        case scope = "scope"
        case spotifyVersion = "spotifyVersion"
        case tokenType = "tokenType"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case userName = "userName"
    }

    public init(accessToken: String, country: String, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, displayName: String, email: String, expiresIn: Int, id: Int, parentId: Int?, product: String, refreshToken: String, roomId: Int?, scope: String, spotifyVersion: String?, tokenType: String, updatedAt: Date, updatedById: Int, userName: String) {
        self.accessToken = accessToken
        self.country = country
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.displayName = displayName
        self.email = email
        self.expiresIn = expiresIn
        self.id = id
        self.parentId = parentId
        self.product = product
        self.refreshToken = refreshToken
        self.roomId = roomId
        self.scope = scope
        self.spotifyVersion = spotifyVersion
        self.tokenType = tokenType
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.userName = userName
    }
}

/// Reward
// MARK: - Reward
public struct Reward: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var eventId: Int
    public var id: Int
    public var redeemedById: Int?
    public var roomId: Int
    public var updatedAt: Date
    public var updatedById: Int
    public var uuid: String
    public var viewCount: Int?

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case eventId = "eventId"
        case id = "id"
        case redeemedById = "redeemedById"
        case roomId = "roomId"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case uuid = "uuid"
        case viewCount = "viewCount"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, eventId: Int, id: Int, redeemedById: Int?, roomId: Int, updatedAt: Date, updatedById: Int, uuid: String, viewCount: Int?) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.eventId = eventId
        self.id = id
        self.redeemedById = redeemedById
        self.roomId = roomId
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.uuid = uuid
        self.viewCount = viewCount
    }
}

/// MealChoice
// MARK: - MealChoice
public struct MealChoice: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var eventId: Int
    public var id: Int
    public var roomId: Int
    public var targetId: Int?
    public var type: TypeEnum
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case eventId = "eventId"
        case id = "id"
        case roomId = "roomId"
        case targetId = "targetId"
        case type = "type"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, eventId: Int, id: Int, roomId: Int, targetId: Int?, type: TypeEnum, updatedAt: Date, updatedById: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.eventId = eventId
        self.id = id
        self.roomId = roomId
        self.targetId = targetId
        self.type = type
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

public enum TypeEnum: String, Codable {
    case drink = "drink"
    case food = "food"
}

/// Artist
// MARK: - Artist
public struct Artist: Persisted, DataConvertible {
    public var artistId: String
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var externalUrl: String?
    public var followersTotal: Int
    public var href: String
    public var id: Int
    public var imageLarge: String?
    public var imageMedium: String?
    public var imageSmall: String?
    public var name: String
    public var popularity: Int
    public var updatedAt: Date
    public var updatedById: Int
    public var uri: String

    public enum CodingKeys: String, CodingKey {
        case artistId = "artistId"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case externalUrl = "externalUrl"
        case followersTotal = "followersTotal"
        case href = "href"
        case id = "id"
        case imageLarge = "imageLarge"
        case imageMedium = "imageMedium"
        case imageSmall = "imageSmall"
        case name = "name"
        case popularity = "popularity"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case uri = "uri"
    }

    public init(artistId: String, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, externalUrl: String?, followersTotal: Int, href: String, id: Int, imageLarge: String?, imageMedium: String?, imageSmall: String?, name: String, popularity: Int, updatedAt: Date, updatedById: Int, uri: String) {
        self.artistId = artistId
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.externalUrl = externalUrl
        self.followersTotal = followersTotal
        self.href = href
        self.id = id
        self.imageLarge = imageLarge
        self.imageMedium = imageMedium
        self.imageSmall = imageSmall
        self.name = name
        self.popularity = popularity
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.uri = uri
    }
}

/// RoomTrack
// MARK: - RoomTrack
public struct RoomTrack: Persisted, DataConvertible {
    public var addedBy: Int?
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var musicroom: Musicroom?
    public var roomId: Int
    public var track: Track?
    public var trackId: Int
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case addedBy = "addedBy"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case musicroom = "musicroom"
        case roomId = "roomId"
        case track = "track"
        case trackId = "trackId"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(addedBy: Int?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, id: Int, musicroom: Musicroom?, roomId: Int, track: Track?, trackId: Int, updatedAt: Date, updatedById: Int) {
        self.addedBy = addedBy
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.musicroom = musicroom
        self.roomId = roomId
        self.track = track
        self.trackId = trackId
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

/// Entitlement
// MARK: - Entitlement
public struct Entitlement: Persisted, DataConvertible {
    public var acceptedAt: Date?
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var expiresAt: Date?
    public var id: Int
    public var musicroom: Musicroom?
    public var rejectedAt: Date?
    public var targetRecordId: Int
    public var type: String
    public var updatedAt: Date
    public var updatedById: Int
    public var user: User?
    public var userId: Int
    public var uuid: String

    public enum CodingKeys: String, CodingKey {
        case acceptedAt = "acceptedAt"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case expiresAt = "expiresAt"
        case id = "id"
        case musicroom = "musicroom"
        case rejectedAt = "rejectedAt"
        case targetRecordId = "targetRecordId"
        case type = "type"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case user = "user"
        case userId = "userId"
        case uuid = "uuid"
    }

    public init(acceptedAt: Date?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, expiresAt: Date?, id: Int, musicroom: Musicroom?, rejectedAt: Date?, targetRecordId: Int, type: String, updatedAt: Date, updatedById: Int, user: User?, userId: Int, uuid: String) {
        self.acceptedAt = acceptedAt
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.expiresAt = expiresAt
        self.id = id
        self.musicroom = musicroom
        self.rejectedAt = rejectedAt
        self.targetRecordId = targetRecordId
        self.type = type
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.user = user
        self.userId = userId
        self.uuid = uuid
    }
}

/// Musicroom
// MARK: - Musicroom
public struct Musicroom: Persisted, DataConvertible {
    public var albumIds: String?
    public var artistIds: String?
    public var createdAt: Date
    public var createdById: Int
    public var createdByUser: User
    public var deletedAt: Date?
    public var deletedById: Int?
    public var deletedByUser: User?
    public var details: String
    public var entitlements: [Entitlement]?
    public var genreNames: String?
    public var hostId: Int?
    public var id: Int
    public var imageLarge: String?
    public var imageMedium: String?
    public var imageSmall: String?
    public var membership: Membership
    public var name: String
    public var playingState: PlayingState?
    public var playlistUri: String?
    public var progressMs: Int?
    public var refreshToken: String?
    public var snapshotId: String?
    public var themeAlbumIds: String?
    public var themeArtistIds: String?
    public var themeGenreNames: String?
    public var themeTrackUri: String
    public var themeTrackUri2: String?
    public var trackUri: String?
    public var updatedAt: Date
    public var updatedById: Int
    public var updatedByUser: User?
    public var uuid: String?

    public enum CodingKeys: String, CodingKey {
        case albumIds = "albumIds"
        case artistIds = "artistIds"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case createdByUser = "createdByUser"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case deletedByUser = "deletedByUser"
        case details = "details"
        case entitlements = "entitlements"
        case genreNames = "genreNames"
        case hostId = "hostId"
        case id = "id"
        case imageLarge = "imageLarge"
        case imageMedium = "imageMedium"
        case imageSmall = "imageSmall"
        case membership = "membership"
        case name = "name"
        case playingState = "playingState"
        case playlistUri = "playlistUri"
        case progressMs = "progressMs"
        case refreshToken = "refreshToken"
        case snapshotId = "snapshotId"
        case themeAlbumIds = "themeAlbumIds"
        case themeArtistIds = "themeArtistIds"
        case themeGenreNames = "themeGenreNames"
        case themeTrackUri = "themeTrackUri"
        case themeTrackUri2 = "themeTrackUri2"
        case trackUri = "trackUri"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case updatedByUser = "updatedByUser"
        case uuid = "uuid"
    }

    public init(albumIds: String?, artistIds: String?, createdAt: Date, createdById: Int, createdByUser: User, deletedAt: Date?, deletedById: Int?, deletedByUser: User?, details: String, entitlements: [Entitlement]?, genreNames: String?, hostId: Int?, id: Int, imageLarge: String?, imageMedium: String?, imageSmall: String?, membership: Membership, name: String, playingState: PlayingState?, playlistUri: String?, progressMs: Int?, refreshToken: String?, snapshotId: String?, themeAlbumIds: String?, themeArtistIds: String?, themeGenreNames: String?, themeTrackUri: String, themeTrackUri2: String?, trackUri: String?, updatedAt: Date, updatedById: Int, updatedByUser: User?, uuid: String?) {
        self.albumIds = albumIds
        self.artistIds = artistIds
        self.createdAt = createdAt
        self.createdById = createdById
        self.createdByUser = createdByUser
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.deletedByUser = deletedByUser
        self.details = details
        self.entitlements = entitlements
        self.genreNames = genreNames
        self.hostId = hostId
        self.id = id
        self.imageLarge = imageLarge
        self.imageMedium = imageMedium
        self.imageSmall = imageSmall
        self.membership = membership
        self.name = name
        self.playingState = playingState
        self.playlistUri = playlistUri
        self.progressMs = progressMs
        self.refreshToken = refreshToken
        self.snapshotId = snapshotId
        self.themeAlbumIds = themeAlbumIds
        self.themeArtistIds = themeArtistIds
        self.themeGenreNames = themeGenreNames
        self.themeTrackUri = themeTrackUri
        self.themeTrackUri2 = themeTrackUri2
        self.trackUri = trackUri
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.updatedByUser = updatedByUser
        self.uuid = uuid
    }
}

/// User
// MARK: - User
public struct User: Persisted, DataConvertible {
    public var activatedAt: Date?
    public var activeDeviceUuid: String?
    public var activeRoomId: Int?
    public var appleIdentifier: String?
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var djRanking: Int?
    public var email: String
    public var followingUserId: Int?
    public var heartPoints: Int?
    public var id: Int
    public var imageLarge: String?
    public var imageMedium: String?
    public var imageSmall: String?
    public var isServiceAccount: Bool?
    public var name: String
    public var passwordHash: String?
    public var playState: PlayState?
    public var refreshTokenSpotify: String?
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case activatedAt = "activatedAt"
        case activeDeviceUuid = "activeDeviceUuid"
        case activeRoomId = "activeRoomId"
        case appleIdentifier = "appleIdentifier"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case djRanking = "djRanking"
        case email = "email"
        case followingUserId = "followingUserId"
        case heartPoints = "heartPoints"
        case id = "id"
        case imageLarge = "imageLarge"
        case imageMedium = "imageMedium"
        case imageSmall = "imageSmall"
        case isServiceAccount = "isServiceAccount"
        case name = "name"
        case passwordHash = "passwordHash"
        case playState = "playState"
        case refreshTokenSpotify = "refreshTokenSpotify"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(activatedAt: Date?, activeDeviceUuid: String?, activeRoomId: Int?, appleIdentifier: String?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, djRanking: Int?, email: String, followingUserId: Int?, heartPoints: Int?, id: Int, imageLarge: String?, imageMedium: String?, imageSmall: String?, isServiceAccount: Bool?, name: String, passwordHash: String?, playState: PlayState?, refreshTokenSpotify: String?, updatedAt: Date, updatedById: Int) {
        self.activatedAt = activatedAt
        self.activeDeviceUuid = activeDeviceUuid
        self.activeRoomId = activeRoomId
        self.appleIdentifier = appleIdentifier
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.djRanking = djRanking
        self.email = email
        self.followingUserId = followingUserId
        self.heartPoints = heartPoints
        self.id = id
        self.imageLarge = imageLarge
        self.imageMedium = imageMedium
        self.imageSmall = imageSmall
        self.isServiceAccount = isServiceAccount
        self.name = name
        self.passwordHash = passwordHash
        self.playState = playState
        self.refreshTokenSpotify = refreshTokenSpotify
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

/// PlayState
// MARK: - PlayState
public struct PlayState: Persisted, DataConvertible {
    public var accessToken: String
    public var country: String
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var deviceUid: String?
    public var displayName: String
    public var durationMs: Int?
    public var email: String
    public var expiresIn: Int
    public var id: Int
    public var lastRefreshedAt: Date?
    public var nextRefreshAt: Date?
    public var playingState: PlayingState?
    public var playingStateChangedAt: Date?
    public var playlistUri: String?
    public var prevPlaylistUri: String?
    public var prevTrackUri: String?
    public var product: String
    public var progressMs: Int?
    public var refreshToken: String
    public var roomId: Int?
    public var scope: String
    public var status: String?
    public var statusChangedAt: Date?
    public var tokenType: String
    public var track: Track?
    public var trackUri: String?
    public var updatedAt: Date
    public var updatedById: Int
    public var userName: String

    public enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case country = "country"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case deviceUid = "deviceUid"
        case displayName = "displayName"
        case durationMs = "durationMs"
        case email = "email"
        case expiresIn = "expiresIn"
        case id = "id"
        case lastRefreshedAt = "lastRefreshedAt"
        case nextRefreshAt = "nextRefreshAt"
        case playingState = "playingState"
        case playingStateChangedAt = "playingStateChangedAt"
        case playlistUri = "playlistUri"
        case prevPlaylistUri = "prevPlaylistUri"
        case prevTrackUri = "prevTrackUri"
        case product = "product"
        case progressMs = "progressMs"
        case refreshToken = "refreshToken"
        case roomId = "roomId"
        case scope = "scope"
        case status = "status"
        case statusChangedAt = "statusChangedAt"
        case tokenType = "tokenType"
        case track = "track"
        case trackUri = "trackUri"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case userName = "userName"
    }

    public init(accessToken: String, country: String, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, deviceUid: String?, displayName: String, durationMs: Int?, email: String, expiresIn: Int, id: Int, lastRefreshedAt: Date?, nextRefreshAt: Date?, playingState: PlayingState?, playingStateChangedAt: Date?, playlistUri: String?, prevPlaylistUri: String?, prevTrackUri: String?, product: String, progressMs: Int?, refreshToken: String, roomId: Int?, scope: String, status: String?, statusChangedAt: Date?, tokenType: String, track: Track?, trackUri: String?, updatedAt: Date, updatedById: Int, userName: String) {
        self.accessToken = accessToken
        self.country = country
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.deviceUid = deviceUid
        self.displayName = displayName
        self.durationMs = durationMs
        self.email = email
        self.expiresIn = expiresIn
        self.id = id
        self.lastRefreshedAt = lastRefreshedAt
        self.nextRefreshAt = nextRefreshAt
        self.playingState = playingState
        self.playingStateChangedAt = playingStateChangedAt
        self.playlistUri = playlistUri
        self.prevPlaylistUri = prevPlaylistUri
        self.prevTrackUri = prevTrackUri
        self.product = product
        self.progressMs = progressMs
        self.refreshToken = refreshToken
        self.roomId = roomId
        self.scope = scope
        self.status = status
        self.statusChangedAt = statusChangedAt
        self.tokenType = tokenType
        self.track = track
        self.trackUri = trackUri
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.userName = userName
    }
}

public enum PlayingState: String, Codable {
    case paused = "PAUSED"
    case playRequested = "PLAY_REQUESTED"
    case playing = "PLAYING"
    case stopped = "STOPPED"
}

/// Track
// MARK: - Track
public struct Track: Persisted, DataConvertible {
    public var albumId: String
    public var artistName: String
    public var colorBackground: String?
    public var colorDetail: String?
    public var colorPrimary: String?
    public var colorSecondary: String?
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var durationMs: Int
    public var explicit: Bool
    public var href: String
    public var id: Int
    public var imageLarge: String
    public var imageMedium: String
    public var imageSmall: String
    public var isLocal: Bool
    public var isrc: String
    public var name: String
    public var popularity: Int
    public var previewUrl: String?
    public var releaseDate: Date
    public var releaseDatePrecision: String?
    public var thumbnailUrl: String
    public var title: String
    public var trackId: String
    public var trackNumber: Int
    public var type: String
    public var updatedAt: Date
    public var updatedById: Int
    public var uri: String

    public enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case artistName = "artistName"
        case colorBackground = "colorBackground"
        case colorDetail = "colorDetail"
        case colorPrimary = "colorPrimary"
        case colorSecondary = "colorSecondary"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case durationMs = "durationMs"
        case explicit = "explicit"
        case href = "href"
        case id = "id"
        case imageLarge = "imageLarge"
        case imageMedium = "imageMedium"
        case imageSmall = "imageSmall"
        case isLocal = "isLocal"
        case isrc = "isrc"
        case name = "name"
        case popularity = "popularity"
        case previewUrl = "previewUrl"
        case releaseDate = "releaseDate"
        case releaseDatePrecision = "releaseDatePrecision"
        case thumbnailUrl = "thumbnailUrl"
        case title = "title"
        case trackId = "trackId"
        case trackNumber = "trackNumber"
        case type = "type"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case uri = "uri"
    }

    public init(albumId: String, artistName: String, colorBackground: String?, colorDetail: String?, colorPrimary: String?, colorSecondary: String?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, durationMs: Int, explicit: Bool, href: String, id: Int, imageLarge: String, imageMedium: String, imageSmall: String, isLocal: Bool, isrc: String, name: String, popularity: Int, previewUrl: String?, releaseDate: Date, releaseDatePrecision: String?, thumbnailUrl: String, title: String, trackId: String, trackNumber: Int, type: String, updatedAt: Date, updatedById: Int, uri: String) {
        self.albumId = albumId
        self.artistName = artistName
        self.colorBackground = colorBackground
        self.colorDetail = colorDetail
        self.colorPrimary = colorPrimary
        self.colorSecondary = colorSecondary
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.durationMs = durationMs
        self.explicit = explicit
        self.href = href
        self.id = id
        self.imageLarge = imageLarge
        self.imageMedium = imageMedium
        self.imageSmall = imageSmall
        self.isLocal = isLocal
        self.isrc = isrc
        self.name = name
        self.popularity = popularity
        self.previewUrl = previewUrl
        self.releaseDate = releaseDate
        self.releaseDatePrecision = releaseDatePrecision
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.trackId = trackId
        self.trackNumber = trackNumber
        self.type = type
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.uri = uri
    }
}

public enum Membership: String, Codable {
    case inviteOnly = "inviteOnly"
    case membershipOpen = "open"
    case membershipPrivate = "private"
}

/// Session
// MARK: - Session
public struct Session: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var deviceUuid: String?
    public var id: Int
    public var token: String
    public var updatedAt: Date
    public var updatedById: Int
    public var userId: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case deviceUuid = "deviceUuid"
        case id = "id"
        case token = "token"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case userId = "userId"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, deviceUuid: String?, id: Int, token: String, updatedAt: Date, updatedById: Int, userId: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.deviceUuid = deviceUuid
        self.id = id
        self.token = token
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.userId = userId
    }
}

/// QueuedTrack
// MARK: - QueuedTrack
public struct QueuedTrack: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var musicroom: Musicroom?
    public var playEndedAt: Date?
    public var playStartedAt: Date?
    public var progressMsStored: Int?
    public var roomId: Int
    public var roomtrackId: Int
    public var skipVoteCount: Int?
    public var track: Track?
    public var trackId: Int
    public var updatedAt: Date
    public var updatedById: Int
    public var voteCount: Int?
    public var votes: [QueuedTrackVote]?

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case musicroom = "musicroom"
        case playEndedAt = "playEndedAt"
        case playStartedAt = "playStartedAt"
        case progressMsStored = "progressMsStored"
        case roomId = "roomId"
        case roomtrackId = "roomtrackId"
        case skipVoteCount = "skipVoteCount"
        case track = "track"
        case trackId = "trackId"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case voteCount = "voteCount"
        case votes = "votes"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, id: Int, musicroom: Musicroom?, playEndedAt: Date?, playStartedAt: Date?, progressMsStored: Int?, roomId: Int, roomtrackId: Int, skipVoteCount: Int?, track: Track?, trackId: Int, updatedAt: Date, updatedById: Int, voteCount: Int?, votes: [QueuedTrackVote]?) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.musicroom = musicroom
        self.playEndedAt = playEndedAt
        self.playStartedAt = playStartedAt
        self.progressMsStored = progressMsStored
        self.roomId = roomId
        self.roomtrackId = roomtrackId
        self.skipVoteCount = skipVoteCount
        self.track = track
        self.trackId = trackId
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.voteCount = voteCount
        self.votes = votes
    }
}

/// QueuedTrackVote
// MARK: - QueuedTrackVote
public struct QueuedTrackVote: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var queuedTrackId: Int
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case queuedTrackId = "queuedTrackId"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, id: Int, queuedTrackId: Int, updatedAt: Date, updatedById: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.queuedTrackId = queuedTrackId
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

/// RoomMembership
// MARK: - RoomMembership
public struct RoomMembership: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var inviteAcceptedAt: Int?
    public var invitedById: Int
    public var isAdmin: Int
    public var roomId: Int
    public var updatedAt: Date
    public var updatedById: Int
    public var userId: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case inviteAcceptedAt = "inviteAcceptedAt"
        case invitedById = "invitedById"
        case isAdmin = "isAdmin"
        case roomId = "roomId"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case userId = "userId"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, id: Int, inviteAcceptedAt: Int?, invitedById: Int, isAdmin: Int, roomId: Int, updatedAt: Date, updatedById: Int, userId: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.inviteAcceptedAt = inviteAcceptedAt
        self.invitedById = invitedById
        self.isAdmin = isAdmin
        self.roomId = roomId
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.userId = userId
    }
}

/// Device
// MARK: - Device
public struct Device: Persisted, DataConvertible {
    public var apnToken: String?
    public var clientVersion: String?
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var model: String
    public var name: String
    public var platform: String
    public var refreshToken: String?
    public var updatedAt: Date
    public var updatedById: Int
    public var uuid: String

    public enum CodingKeys: String, CodingKey {
        case apnToken = "apnToken"
        case clientVersion = "clientVersion"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case model = "model"
        case name = "name"
        case platform = "platform"
        case refreshToken = "refreshToken"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case uuid = "uuid"
    }

    public init(apnToken: String?, clientVersion: String?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, id: Int, model: String, name: String, platform: String, refreshToken: String?, updatedAt: Date, updatedById: Int, uuid: String) {
        self.apnToken = apnToken
        self.clientVersion = clientVersion
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.model = model
        self.name = name
        self.platform = platform
        self.refreshToken = refreshToken
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.uuid = uuid
    }
}

/// LogEntry
// MARK: - LogEntry
public struct LogEntry: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var deviceName: String
    public var id: Int
    public var line: String
    public var platform: String
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case deviceName = "deviceName"
        case id = "id"
        case line = "line"
        case platform = "platform"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, deviceName: String, id: Int, line: String, platform: String, updatedAt: Date, updatedById: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.deviceName = deviceName
        self.id = id
        self.line = line
        self.platform = platform
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

/// UserNotification
// MARK: - UserNotification
public struct UserNotification: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var href: String
    public var id: Int
    public var targetUserId: String
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case href = "href"
        case id = "id"
        case targetUserId = "targetUserId"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, href: String, id: Int, targetUserId: String, updatedAt: Date, updatedById: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.href = href
        self.id = id
        self.targetUserId = targetUserId
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

/// Genre
// MARK: - Genre
public struct Genre: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var imageLarge: String?
    public var imageMedium: String?
    public var imageSmall: String?
    public var name: String
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case imageLarge = "imageLarge"
        case imageMedium = "imageMedium"
        case imageSmall = "imageSmall"
        case name = "name"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, id: Int, imageLarge: String?, imageMedium: String?, imageSmall: String?, name: String, updatedAt: Date, updatedById: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.imageLarge = imageLarge
        self.imageMedium = imageMedium
        self.imageSmall = imageSmall
        self.name = name
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

/// Food
// MARK: - Food
public struct Food: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var imageName: String
    public var region: String
    public var subtitle: String
    public var title: String
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case imageName = "imageName"
        case region = "region"
        case subtitle = "subtitle"
        case title = "title"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, id: Int, imageName: String, region: String, subtitle: String, title: String, updatedAt: Date, updatedById: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.imageName = imageName
        self.region = region
        self.subtitle = subtitle
        self.title = title
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

/// Drink
// MARK: - Drink
public struct Drink: Persisted, DataConvertible {
    public var alcoholContent: Int?
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var imageName: String
    public var subtitle: String
    public var title: String
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case alcoholContent = "alcoholContent"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case imageName = "imageName"
        case subtitle = "subtitle"
        case title = "title"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(alcoholContent: Int?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, id: Int, imageName: String, subtitle: String, title: String, updatedAt: Date, updatedById: Int) {
        self.alcoholContent = alcoholContent
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.imageName = imageName
        self.subtitle = subtitle
        self.title = title
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

/// Event
// MARK: - Event
public struct Event: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var endsAt: Date
    public var id: Int
    public var roomId: Int
    public var startsAt: Date
    public var subtitle: String
    public var title: String
    public var updatedAt: Date
    public var updatedById: Int
    public var uuid: String
    public var venue: String?

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case endsAt = "endsAt"
        case id = "id"
        case roomId = "roomId"
        case startsAt = "startsAt"
        case subtitle = "subtitle"
        case title = "title"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case uuid = "uuid"
        case venue = "venue"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, endsAt: Date, id: Int, roomId: Int, startsAt: Date, subtitle: String, title: String, updatedAt: Date, updatedById: Int, uuid: String, venue: String?) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.endsAt = endsAt
        self.id = id
        self.roomId = roomId
        self.startsAt = startsAt
        self.subtitle = subtitle
        self.title = title
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.uuid = uuid
        self.venue = venue
    }
}
