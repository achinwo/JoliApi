// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let authToken = try? JSONDecoder().decode(AuthToken.self, from: jsonData)
//   let contentAttribute = try? JSONDecoder().decode(ContentAttribute.self, from: jsonData)
//   let reward = try? JSONDecoder().decode(Reward.self, from: jsonData)
//   let mealChoice = try? JSONDecoder().decode(MealChoice.self, from: jsonData)
//   let user = try? JSONDecoder().decode(User.self, from: jsonData)
//   let userRating = try? JSONDecoder().decode(UserRating.self, from: jsonData)
//   let musicroom = try? JSONDecoder().decode(Musicroom.self, from: jsonData)
//   let artist = try? JSONDecoder().decode(Artist.self, from: jsonData)
//   let roomTrack = try? JSONDecoder().decode(RoomTrack.self, from: jsonData)
//   let track = try? JSONDecoder().decode(Track.self, from: jsonData)
//   let session = try? JSONDecoder().decode(Session.self, from: jsonData)
//   let queuedTrack = try? JSONDecoder().decode(QueuedTrack.self, from: jsonData)
//   let queuedTrackVote = try? JSONDecoder().decode(QueuedTrackVote.self, from: jsonData)
//   let roomMembership = try? JSONDecoder().decode(RoomMembership.self, from: jsonData)
//   let device = try? JSONDecoder().decode(Device.self, from: jsonData)
//   let playState = try? JSONDecoder().decode(PlayState.self, from: jsonData)
//   let logEntry = try? JSONDecoder().decode(LogEntry.self, from: jsonData)
//   let entitlement = try? JSONDecoder().decode(Entitlement.self, from: jsonData)
//   let userNotification = try? JSONDecoder().decode(UserNotification.self, from: jsonData)
//   let genre = try? JSONDecoder().decode(Genre.self, from: jsonData)
//   let food = try? JSONDecoder().decode(Food.self, from: jsonData)
//   let drink = try? JSONDecoder().decode(Drink.self, from: jsonData)
//   let event = try? JSONDecoder().decode(Event.self, from: jsonData)
//   let stikrExperienceData = try? JSONDecoder().decode(StikrExperienceData.self, from: jsonData)
//   let visualCode = try? JSONDecoder().decode(VisualCode.self, from: jsonData)
//   let stikrExperienceDataItem = try? JSONDecoder().decode(StikrExperienceDataItem.self, from: jsonData)
//   let productSummary = try? JSONDecoder().decode(ProductSummary.self, from: jsonData)
//   let puData = try? JSONDecoder().decode(PuData.self, from: jsonData)

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

/// ContentAttribute
// MARK: - ContentAttribute
public struct ContentAttribute: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var data: ContentAttributeData
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var name: String
    public var targetModel: String
    public var targetRecordId: Int
    public var updatedAt: Date
    public var updatedById: Int
    public var uuid: String

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case data = "data"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case name = "name"
        case targetModel = "targetModel"
        case targetRecordId = "targetRecordId"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case uuid = "uuid"
    }

    public init(createdAt: Date, createdById: Int, data: ContentAttributeData, deletedAt: Date?, deletedById: Int?, id: Int, name: String, targetModel: String, targetRecordId: Int, updatedAt: Date, updatedById: Int, uuid: String) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.data = data
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.name = name
        self.targetModel = targetModel
        self.targetRecordId = targetRecordId
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.uuid = uuid
    }
}

// MARK: - ContentAttributeData
public struct ContentAttributeData: Codable, Equatable, Hashable {
    public var backgroundColor: String?
    public var backgroundColor2: String?
    public var backgroundImageUrl: String?
    public var backgroundMode: String?
    public var backgroundOpacity: Double?
    public var bold: Bool?
    public var color: String?
    public var contentAttributeName: String?
    public var contentAttributeUuid: String?
    public var fontName: String?
    public var fontSize: Double?
    public var textContent: String?

    public enum CodingKeys: String, CodingKey {
        case backgroundColor = "backgroundColor"
        case backgroundColor2 = "backgroundColor2"
        case backgroundImageUrl = "backgroundImageUrl"
        case backgroundMode = "backgroundMode"
        case backgroundOpacity = "backgroundOpacity"
        case bold = "bold"
        case color = "color"
        case contentAttributeName = "contentAttributeName"
        case contentAttributeUuid = "contentAttributeUuid"
        case fontName = "fontName"
        case fontSize = "fontSize"
        case textContent = "textContent"
    }

    public init(backgroundColor: String?, backgroundColor2: String?, backgroundImageUrl: String?, backgroundMode: String?, backgroundOpacity: Double?, bold: Bool?, color: String?, contentAttributeName: String?, contentAttributeUuid: String?, fontName: String?, fontSize: Double?, textContent: String?) {
        self.backgroundColor = backgroundColor
        self.backgroundColor2 = backgroundColor2
        self.backgroundImageUrl = backgroundImageUrl
        self.backgroundMode = backgroundMode
        self.backgroundOpacity = backgroundOpacity
        self.bold = bold
        self.color = color
        self.contentAttributeName = contentAttributeName
        self.contentAttributeUuid = contentAttributeUuid
        self.fontName = fontName
        self.fontSize = fontSize
        self.textContent = textContent
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
    public var additionalInfo: String?
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
        case additionalInfo = "additionalInfo"
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

    public init(additionalInfo: String?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, eventId: Int, id: Int, roomId: Int, targetId: Int?, type: TypeEnum, updatedAt: Date, updatedById: Int) {
        self.additionalInfo = additionalInfo
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

/// UserRating
// MARK: - UserRating
public struct UserRating: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var deviceUuid: String
    public var id: Int
    public var rating: Int
    public var tag: String
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case deviceUuid = "deviceUuid"
        case id = "id"
        case rating = "rating"
        case tag = "tag"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, deviceUuid: String, id: Int, rating: Int, tag: String, updatedAt: Date, updatedById: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.deviceUuid = deviceUuid
        self.id = id
        self.rating = rating
        self.tag = tag
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
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
    public var appleAccessToken: String?
    public var appleExpiresIn: Int?
    public var appleIdAuthCode: String?
    public var appleIdToken: String?
    public var appleIdentifier: String?
    public var appleRefreshToken: String?
    public var autoRenewEnabled: Bool?
    public var autoRenewProductId: String?
    public var consumedProductDiscounts: String?
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var djRanking: Int?
    public var email: String
    public var expirationIntent: String?
    public var followingUserId: Int?
    public var heartPoints: Int?
    public var id: Int
    public var imageLarge: String?
    public var imageMedium: String?
    public var imageSmall: String?
    public var inBillingRetry: Bool?
    public var isServiceAccount: Bool?
    public var latestExpiryDate: Date?
    public var latestReceiptData: String?
    public var name: String
    public var originalTransactionId: String?
    public var passwordHash: String?
    public var playState: PlayState?
    public var refreshTokenSpotify: String?
    public var subscriptionProductId: String?
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case activatedAt = "activatedAt"
        case activeDeviceUuid = "activeDeviceUuid"
        case activeRoomId = "activeRoomId"
        case appleAccessToken = "appleAccessToken"
        case appleExpiresIn = "appleExpiresIn"
        case appleIdAuthCode = "appleIdAuthCode"
        case appleIdToken = "appleIdToken"
        case appleIdentifier = "appleIdentifier"
        case appleRefreshToken = "appleRefreshToken"
        case autoRenewEnabled = "autoRenewEnabled"
        case autoRenewProductId = "autoRenewProductId"
        case consumedProductDiscounts = "consumedProductDiscounts"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case djRanking = "djRanking"
        case email = "email"
        case expirationIntent = "expirationIntent"
        case followingUserId = "followingUserId"
        case heartPoints = "heartPoints"
        case id = "id"
        case imageLarge = "imageLarge"
        case imageMedium = "imageMedium"
        case imageSmall = "imageSmall"
        case inBillingRetry = "inBillingRetry"
        case isServiceAccount = "isServiceAccount"
        case latestExpiryDate = "latestExpiryDate"
        case latestReceiptData = "latestReceiptData"
        case name = "name"
        case originalTransactionId = "originalTransactionId"
        case passwordHash = "passwordHash"
        case playState = "playState"
        case refreshTokenSpotify = "refreshTokenSpotify"
        case subscriptionProductId = "subscriptionProductId"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(activatedAt: Date?, activeDeviceUuid: String?, activeRoomId: Int?, appleAccessToken: String?, appleExpiresIn: Int?, appleIdAuthCode: String?, appleIdToken: String?, appleIdentifier: String?, appleRefreshToken: String?, autoRenewEnabled: Bool?, autoRenewProductId: String?, consumedProductDiscounts: String?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, djRanking: Int?, email: String, expirationIntent: String?, followingUserId: Int?, heartPoints: Int?, id: Int, imageLarge: String?, imageMedium: String?, imageSmall: String?, inBillingRetry: Bool?, isServiceAccount: Bool?, latestExpiryDate: Date?, latestReceiptData: String?, name: String, originalTransactionId: String?, passwordHash: String?, playState: PlayState?, refreshTokenSpotify: String?, subscriptionProductId: String?, updatedAt: Date, updatedById: Int) {
        self.activatedAt = activatedAt
        self.activeDeviceUuid = activeDeviceUuid
        self.activeRoomId = activeRoomId
        self.appleAccessToken = appleAccessToken
        self.appleExpiresIn = appleExpiresIn
        self.appleIdAuthCode = appleIdAuthCode
        self.appleIdToken = appleIdToken
        self.appleIdentifier = appleIdentifier
        self.appleRefreshToken = appleRefreshToken
        self.autoRenewEnabled = autoRenewEnabled
        self.autoRenewProductId = autoRenewProductId
        self.consumedProductDiscounts = consumedProductDiscounts
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.djRanking = djRanking
        self.email = email
        self.expirationIntent = expirationIntent
        self.followingUserId = followingUserId
        self.heartPoints = heartPoints
        self.id = id
        self.imageLarge = imageLarge
        self.imageMedium = imageMedium
        self.imageSmall = imageSmall
        self.inBillingRetry = inBillingRetry
        self.isServiceAccount = isServiceAccount
        self.latestExpiryDate = latestExpiryDate
        self.latestReceiptData = latestReceiptData
        self.name = name
        self.originalTransactionId = originalTransactionId
        self.passwordHash = passwordHash
        self.playState = playState
        self.refreshTokenSpotify = refreshTokenSpotify
        self.subscriptionProductId = subscriptionProductId
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
    public var appName: String?
    public var clientVersion: String?
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var model: String
    public var name: String
    public var platform: String
    public var platformVersion: String?
    public var refreshToken: String?
    public var updatedAt: Date
    public var updatedById: Int
    public var uuid: String

    public enum CodingKeys: String, CodingKey {
        case apnToken = "apnToken"
        case appName = "appName"
        case clientVersion = "clientVersion"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case model = "model"
        case name = "name"
        case platform = "platform"
        case platformVersion = "platformVersion"
        case refreshToken = "refreshToken"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case uuid = "uuid"
    }

    public init(apnToken: String?, appName: String?, clientVersion: String?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, id: Int, model: String, name: String, platform: String, platformVersion: String?, refreshToken: String?, updatedAt: Date, updatedById: Int, uuid: String) {
        self.apnToken = apnToken
        self.appName = appName
        self.clientVersion = clientVersion
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.model = model
        self.name = name
        self.platform = platform
        self.platformVersion = platformVersion
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

/// StikrExperienceData
// MARK: - StikrExperienceData
public struct StikrExperienceData: Persisted, DataConvertible {
    public var apnToken: String?
    public var backgroundColor1: String?
    public var backgroundColor2: String?
    public var backgroundImageUrl: String?
    public var bannerImageUrl: String?
    public var bannerVideoUrl: String?
    public var brandColorAccent: String?
    public var brandColorPrimary: String?
    public var brandColorSecondary: String?
    public var brandContactEmail: String?
    public var brandContactPhoneNumber: String?
    public var brandName: String
    public var callToActionIconName: String?
    public var callToActionLabel: String?
    public var cardImageUrl: String?
    public var cardSubtitle: String?
    public var cardTitle: String?
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var deviceUuid: String
    public var experienceDataAccess: ExperienceDataAccess?
    public var experienceTypeName: String
    public var id: Int
    public var items: [StikrExperienceDataItem]?
    public var landingPageText: String?
    public var logoImageUrl: String?
    public var productDescription: String?
    public var productImageUrl: String?
    public var productName: String?
    public var releaseDate: Date?
    public var releasePlatformInstaUsername: String?
    public var releasePlatformLogoUrl: String?
    public var releasePlatformName: String?
    public var socialFacebookPage: String?
    public var socialInstagramTag: String?
    public var socialInstagramUsername: String?
    public var socialTiktokUsername: String?
    public var socialTwitterUsername: String?
    public var storeDeliverooUrl: String?
    public var storeUbereatsUrl: String?
    public var updatedAt: Date
    public var updatedById: Int
    public var uuid: String
    public var visualcodes: [VisualCode]?
    public var websiteLabel: String?
    public var websiteUrl: String?

    public enum CodingKeys: String, CodingKey {
        case apnToken = "apnToken"
        case backgroundColor1 = "backgroundColor1"
        case backgroundColor2 = "backgroundColor2"
        case backgroundImageUrl = "backgroundImageUrl"
        case bannerImageUrl = "bannerImageUrl"
        case bannerVideoUrl = "bannerVideoUrl"
        case brandColorAccent = "brandColorAccent"
        case brandColorPrimary = "brandColorPrimary"
        case brandColorSecondary = "brandColorSecondary"
        case brandContactEmail = "brandContactEmail"
        case brandContactPhoneNumber = "brandContactPhoneNumber"
        case brandName = "brandName"
        case callToActionIconName = "callToActionIconName"
        case callToActionLabel = "callToActionLabel"
        case cardImageUrl = "cardImageUrl"
        case cardSubtitle = "cardSubtitle"
        case cardTitle = "cardTitle"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case deviceUuid = "deviceUuid"
        case experienceDataAccess = "experienceDataAccess"
        case experienceTypeName = "experienceTypeName"
        case id = "id"
        case items = "items"
        case landingPageText = "landingPageText"
        case logoImageUrl = "logoImageUrl"
        case productDescription = "productDescription"
        case productImageUrl = "productImageUrl"
        case productName = "productName"
        case releaseDate = "releaseDate"
        case releasePlatformInstaUsername = "releasePlatformInstaUsername"
        case releasePlatformLogoUrl = "releasePlatformLogoUrl"
        case releasePlatformName = "releasePlatformName"
        case socialFacebookPage = "socialFacebookPage"
        case socialInstagramTag = "socialInstagramTag"
        case socialInstagramUsername = "socialInstagramUsername"
        case socialTiktokUsername = "socialTiktokUsername"
        case socialTwitterUsername = "socialTwitterUsername"
        case storeDeliverooUrl = "storeDeliverooUrl"
        case storeUbereatsUrl = "storeUbereatsUrl"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case uuid = "uuid"
        case visualcodes = "visualcodes"
        case websiteLabel = "websiteLabel"
        case websiteUrl = "websiteUrl"
    }

    public init(apnToken: String?, backgroundColor1: String?, backgroundColor2: String?, backgroundImageUrl: String?, bannerImageUrl: String?, bannerVideoUrl: String?, brandColorAccent: String?, brandColorPrimary: String?, brandColorSecondary: String?, brandContactEmail: String?, brandContactPhoneNumber: String?, brandName: String, callToActionIconName: String?, callToActionLabel: String?, cardImageUrl: String?, cardSubtitle: String?, cardTitle: String?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, deviceUuid: String, experienceDataAccess: ExperienceDataAccess?, experienceTypeName: String, id: Int, items: [StikrExperienceDataItem]?, landingPageText: String?, logoImageUrl: String?, productDescription: String?, productImageUrl: String?, productName: String?, releaseDate: Date?, releasePlatformInstaUsername: String?, releasePlatformLogoUrl: String?, releasePlatformName: String?, socialFacebookPage: String?, socialInstagramTag: String?, socialInstagramUsername: String?, socialTiktokUsername: String?, socialTwitterUsername: String?, storeDeliverooUrl: String?, storeUbereatsUrl: String?, updatedAt: Date, updatedById: Int, uuid: String, visualcodes: [VisualCode]?, websiteLabel: String?, websiteUrl: String?) {
        self.apnToken = apnToken
        self.backgroundColor1 = backgroundColor1
        self.backgroundColor2 = backgroundColor2
        self.backgroundImageUrl = backgroundImageUrl
        self.bannerImageUrl = bannerImageUrl
        self.bannerVideoUrl = bannerVideoUrl
        self.brandColorAccent = brandColorAccent
        self.brandColorPrimary = brandColorPrimary
        self.brandColorSecondary = brandColorSecondary
        self.brandContactEmail = brandContactEmail
        self.brandContactPhoneNumber = brandContactPhoneNumber
        self.brandName = brandName
        self.callToActionIconName = callToActionIconName
        self.callToActionLabel = callToActionLabel
        self.cardImageUrl = cardImageUrl
        self.cardSubtitle = cardSubtitle
        self.cardTitle = cardTitle
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.deviceUuid = deviceUuid
        self.experienceDataAccess = experienceDataAccess
        self.experienceTypeName = experienceTypeName
        self.id = id
        self.items = items
        self.landingPageText = landingPageText
        self.logoImageUrl = logoImageUrl
        self.productDescription = productDescription
        self.productImageUrl = productImageUrl
        self.productName = productName
        self.releaseDate = releaseDate
        self.releasePlatformInstaUsername = releasePlatformInstaUsername
        self.releasePlatformLogoUrl = releasePlatformLogoUrl
        self.releasePlatformName = releasePlatformName
        self.socialFacebookPage = socialFacebookPage
        self.socialInstagramTag = socialInstagramTag
        self.socialInstagramUsername = socialInstagramUsername
        self.socialTiktokUsername = socialTiktokUsername
        self.socialTwitterUsername = socialTwitterUsername
        self.storeDeliverooUrl = storeDeliverooUrl
        self.storeUbereatsUrl = storeUbereatsUrl
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.uuid = uuid
        self.visualcodes = visualcodes
        self.websiteLabel = websiteLabel
        self.websiteUrl = websiteUrl
    }
}

public enum ExperienceDataAccess: String, Codable {
    case experienceDataAccessPrivate = "private"
    case experienceDataAccessPublic = "public"
    case restricted = "restricted"
}

/// StikrExperienceDataItem
// MARK: - StikrExperienceDataItem
public struct StikrExperienceDataItem: Persisted, DataConvertible {
    public var aliasTitle: String?
    public var caution: String?
    public var createdAt: Date
    public var createdById: Int
    public var defaultPrice: Int?
    public var deletedAt: Date?
    public var deletedById: Int?
    public var duration: Int?
    public var experienceId: Int
    public var experienceItemType: ExperienceItemType
    public var id: Int
    public var imageName: String?
    public var isOptional: Bool?
    public var itemGrouping: String?
    public var itemNo: Int?
    public var itemSubgrouping: String?
    public var parentExperienceItemId: Int?
    public var quantityAvailable: Int?
    public var spicy: Spicy?
    public var subtitle: String?
    public var title: String?
    public var updatedAt: Date
    public var updatedById: Int
    public var uuid: String

    public enum CodingKeys: String, CodingKey {
        case aliasTitle = "aliasTitle"
        case caution = "caution"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case defaultPrice = "defaultPrice"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case duration = "duration"
        case experienceId = "experienceId"
        case experienceItemType = "experienceItemType"
        case id = "id"
        case imageName = "imageName"
        case isOptional = "isOptional"
        case itemGrouping = "itemGrouping"
        case itemNo = "itemNo"
        case itemSubgrouping = "itemSubgrouping"
        case parentExperienceItemId = "parentExperienceItemId"
        case quantityAvailable = "quantityAvailable"
        case spicy = "spicy"
        case subtitle = "subtitle"
        case title = "title"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case uuid = "uuid"
    }

    public init(aliasTitle: String?, caution: String?, createdAt: Date, createdById: Int, defaultPrice: Int?, deletedAt: Date?, deletedById: Int?, duration: Int?, experienceId: Int, experienceItemType: ExperienceItemType, id: Int, imageName: String?, isOptional: Bool?, itemGrouping: String?, itemNo: Int?, itemSubgrouping: String?, parentExperienceItemId: Int?, quantityAvailable: Int?, spicy: Spicy?, subtitle: String?, title: String?, updatedAt: Date, updatedById: Int, uuid: String) {
        self.aliasTitle = aliasTitle
        self.caution = caution
        self.createdAt = createdAt
        self.createdById = createdById
        self.defaultPrice = defaultPrice
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.duration = duration
        self.experienceId = experienceId
        self.experienceItemType = experienceItemType
        self.id = id
        self.imageName = imageName
        self.isOptional = isOptional
        self.itemGrouping = itemGrouping
        self.itemNo = itemNo
        self.itemSubgrouping = itemSubgrouping
        self.parentExperienceItemId = parentExperienceItemId
        self.quantityAvailable = quantityAvailable
        self.spicy = spicy
        self.subtitle = subtitle
        self.title = title
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.uuid = uuid
    }
}

public enum ExperienceItemType: String, Codable {
    case mealPrepIngredient = "mealPrepIngredient"
    case mealPrepStep = "mealPrepStep"
    case menuDrinkItem = "menuDrinkItem"
    case menuFoodItem = "menuFoodItem"
    case menuFoodNutrition = "menuFoodNutrition"
    case person = "person"
    case product = "product"
    case profileSkill = "profileSkill"
}

public enum Spicy: String, Codable {
    case extraHot = "extraHot"
    case hot = "hot"
    case mild = "mild"
}

/// VisualCode
// MARK: - VisualCode
public struct VisualCode: Persisted, DataConvertible {
    public var backgroundColor: String
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var experienceId: Int
    public var foregroundColor: String
    public var id: Int
    public var index: Int
    public var interactionType: InteractionType
    public var logo: Logo
    public var style: Style
    public var updatedAt: Date
    public var updatedById: Int
    public var url: String

    public enum CodingKeys: String, CodingKey {
        case backgroundColor = "backgroundColor"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case experienceId = "experienceId"
        case foregroundColor = "foregroundColor"
        case id = "id"
        case index = "index"
        case interactionType = "interactionType"
        case logo = "logo"
        case style = "style"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case url = "url"
    }

    public init(backgroundColor: String, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, experienceId: Int, foregroundColor: String, id: Int, index: Int, interactionType: InteractionType, logo: Logo, style: Style, updatedAt: Date, updatedById: Int, url: String) {
        self.backgroundColor = backgroundColor
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.experienceId = experienceId
        self.foregroundColor = foregroundColor
        self.id = id
        self.index = index
        self.interactionType = interactionType
        self.logo = logo
        self.style = style
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.url = url
    }
}

public enum InteractionType: String, Codable {
    case cam = "cam"
    case nfc = "nfc"
}

public enum Logo: String, Codable {
    case badge = "badge"
    case none = "none"
}

public enum Style: String, Codable {
    case appclip = "appclip"
    case qr = "qr"
}

/// ProductSummary
// MARK: - ProductSummary
public struct ProductSummary: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var isDownloadable: Bool
    public var isFamilyShareable: Bool
    public var localizedDescription: String
    public var localizedTitle: String
    public var price: Int
    public var priceLocale: String
    public var productIdentifier: String
    public var subscriptionGroupIdentifier: String?
    public var subscriptionPeriodUnit: Int?
    public var subscriptionPeriodUnits: Int?
    public var updatedAt: Date
    public var updatedById: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case isDownloadable = "isDownloadable"
        case isFamilyShareable = "isFamilyShareable"
        case localizedDescription = "localizedDescription"
        case localizedTitle = "localizedTitle"
        case price = "price"
        case priceLocale = "priceLocale"
        case productIdentifier = "productIdentifier"
        case subscriptionGroupIdentifier = "subscriptionGroupIdentifier"
        case subscriptionPeriodUnit = "subscriptionPeriodUnit"
        case subscriptionPeriodUnits = "subscriptionPeriodUnits"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, id: Int, isDownloadable: Bool, isFamilyShareable: Bool, localizedDescription: String, localizedTitle: String, price: Int, priceLocale: String, productIdentifier: String, subscriptionGroupIdentifier: String?, subscriptionPeriodUnit: Int?, subscriptionPeriodUnits: Int?, updatedAt: Date, updatedById: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.isDownloadable = isDownloadable
        self.isFamilyShareable = isFamilyShareable
        self.localizedDescription = localizedDescription
        self.localizedTitle = localizedTitle
        self.price = price
        self.priceLocale = priceLocale
        self.productIdentifier = productIdentifier
        self.subscriptionGroupIdentifier = subscriptionGroupIdentifier
        self.subscriptionPeriodUnit = subscriptionPeriodUnit
        self.subscriptionPeriodUnits = subscriptionPeriodUnits
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

/// PuData
// MARK: - PuData
public struct PuData: Persisted, DataConvertible {
    public var containsAlterations: Bool?
    public var containsIncorrectPuName: Bool?
    public var contributorUsername: String?
    public var createdAt: Date
    public var createdById: Int
    public var deletedAt: Date?
    public var deletedById: Int?
    public var documentHash: String?
    public var documentSize: Int
    public var documentType: String
    public var documentUpdatedAt: String
    public var documentUrl: String
    public var electionSession: Int?
    public var id: Int
    public var isInecStampAbsent: Bool?
    public var isNoneEceightForm: Bool?
    public var isPuNameCorrect: Bool?
    public var isResultIllegible: Bool?
    public var isResultLegible: Bool?
    public var lgaId: Int?
    public var lgaName: String?
    public var name: String
    public var numberOfPrevDocuments: Int?
    public var puCode: String
    public var puId: String
    public var stateId: String
    public var stateName: String?
    public var updatedAt: Date
    public var updatedById: Int
    public var votersAccredited: Int?
    public var votesApc: Int?
    public var votesCast: Int?
    public var votesLp: Int?
    public var votesNnpp: Int?
    public var votesPdp: Int?
    public var wardId: String
    public var wardName: String

    public enum CodingKeys: String, CodingKey {
        case containsAlterations = "containsAlterations"
        case containsIncorrectPuName = "containsIncorrectPuName"
        case contributorUsername = "contributorUsername"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case documentHash = "documentHash"
        case documentSize = "documentSize"
        case documentType = "documentType"
        case documentUpdatedAt = "documentUpdatedAt"
        case documentUrl = "documentUrl"
        case electionSession = "electionSession"
        case id = "id"
        case isInecStampAbsent = "isInecStampAbsent"
        case isNoneEceightForm = "isNoneEceightForm"
        case isPuNameCorrect = "isPuNameCorrect"
        case isResultIllegible = "isResultIllegible"
        case isResultLegible = "isResultLegible"
        case lgaId = "lgaId"
        case lgaName = "lgaName"
        case name = "name"
        case numberOfPrevDocuments = "numberOfPrevDocuments"
        case puCode = "puCode"
        case puId = "puId"
        case stateId = "stateId"
        case stateName = "stateName"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case votersAccredited = "votersAccredited"
        case votesApc = "votesApc"
        case votesCast = "votesCast"
        case votesLp = "votesLp"
        case votesNnpp = "votesNnpp"
        case votesPdp = "votesPdp"
        case wardId = "wardId"
        case wardName = "wardName"
    }

    public init(containsAlterations: Bool?, containsIncorrectPuName: Bool?, contributorUsername: String?, createdAt: Date, createdById: Int, deletedAt: Date?, deletedById: Int?, documentHash: String?, documentSize: Int, documentType: String, documentUpdatedAt: String, documentUrl: String, electionSession: Int?, id: Int, isInecStampAbsent: Bool?, isNoneEceightForm: Bool?, isPuNameCorrect: Bool?, isResultIllegible: Bool?, isResultLegible: Bool?, lgaId: Int?, lgaName: String?, name: String, numberOfPrevDocuments: Int?, puCode: String, puId: String, stateId: String, stateName: String?, updatedAt: Date, updatedById: Int, votersAccredited: Int?, votesApc: Int?, votesCast: Int?, votesLp: Int?, votesNnpp: Int?, votesPdp: Int?, wardId: String, wardName: String) {
        self.containsAlterations = containsAlterations
        self.containsIncorrectPuName = containsIncorrectPuName
        self.contributorUsername = contributorUsername
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.documentHash = documentHash
        self.documentSize = documentSize
        self.documentType = documentType
        self.documentUpdatedAt = documentUpdatedAt
        self.documentUrl = documentUrl
        self.electionSession = electionSession
        self.id = id
        self.isInecStampAbsent = isInecStampAbsent
        self.isNoneEceightForm = isNoneEceightForm
        self.isPuNameCorrect = isPuNameCorrect
        self.isResultIllegible = isResultIllegible
        self.isResultLegible = isResultLegible
        self.lgaId = lgaId
        self.lgaName = lgaName
        self.name = name
        self.numberOfPrevDocuments = numberOfPrevDocuments
        self.puCode = puCode
        self.puId = puId
        self.stateId = stateId
        self.stateName = stateName
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.votersAccredited = votersAccredited
        self.votesApc = votesApc
        self.votesCast = votesCast
        self.votesLp = votesLp
        self.votesNnpp = votesNnpp
        self.votesPdp = votesPdp
        self.wardId = wardId
        self.wardName = wardName
    }
}
