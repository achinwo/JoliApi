// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let authToken = try? newJSONDecoder().decode(AuthToken.self, from: jsonData)
//   let musicroom = try? newJSONDecoder().decode(Musicroom.self, from: jsonData)
//   let roomTrack = try? newJSONDecoder().decode(RoomTrack.self, from: jsonData)
//   let queuedTrack = try? newJSONDecoder().decode(QueuedTrack.self, from: jsonData)
//   let queuedTrackVote = try? newJSONDecoder().decode(QueuedTrackVote.self, from: jsonData)
//   let session = try? newJSONDecoder().decode(Session.self, from: jsonData)
//   let user = try? newJSONDecoder().decode(User.self, from: jsonData)
//   let track = try? newJSONDecoder().decode(Track.self, from: jsonData)
//   let roomMembership = try? newJSONDecoder().decode(RoomMembership.self, from: jsonData)

import Foundation

/// AuthToken
// MARK: - AuthToken
public struct AuthToken: Persisted, DataConvertible {
    public var accessToken: String
    public var createdAt: Date
    public var createdById: Int?
    public var deletedAt: Date?
    public var deletedById: Int?
    public var expiresIn: Int
    public var id: Int
    public var parentId: Int?
    public var refreshToken: String?
    public var scope: String
    public var tokenType: String?
    public var updatedAt: Date
    public var updatedById: Int?
    public var userId: Int?

    public enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case expiresIn = "expiresIn"
        case id = "id"
        case parentId = "parentId"
        case refreshToken = "refreshToken"
        case scope = "scope"
        case tokenType = "tokenType"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case userId = "userId"
    }

    public init(accessToken: String, createdAt: Date, createdById: Int?, deletedAt: Date?, deletedById: Int?, expiresIn: Int, id: Int, parentId: Int?, refreshToken: String?, scope: String, tokenType: String?, updatedAt: Date, updatedById: Int?, userId: Int?) {
        self.accessToken = accessToken
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.expiresIn = expiresIn
        self.id = id
        self.parentId = parentId
        self.refreshToken = refreshToken
        self.scope = scope
        self.tokenType = tokenType
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.userId = userId
    }
}

/// RoomTrack
// MARK: - RoomTrack
public struct RoomTrack: Persisted, DataConvertible {
    public var addedBy: Int?
    public var createdAt: Date
    public var createdById: Int?
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var musicroom: Musicroom?
    public var roomId: Int
    public var track: Track?
    public var trackId: Int
    public var updatedAt: Date
    public var updatedById: Int?

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

    public init(addedBy: Int?, createdAt: Date, createdById: Int?, deletedAt: Date?, deletedById: Int?, id: Int, musicroom: Musicroom?, roomId: Int, track: Track?, trackId: Int, updatedAt: Date, updatedById: Int?) {
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

/// Musicroom
// MARK: - Musicroom
public struct Musicroom: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int?
    public var deletedAt: Date?
    public var deletedById: Int?
    public var details: String
    public var id: Int
    public var membership: Membership
    public var name: String
    public var updatedAt: Date
    public var updatedById: Int?

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case details = "details"
        case id = "id"
        case membership = "membership"
        case name = "name"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(createdAt: Date, createdById: Int?, deletedAt: Date?, deletedById: Int?, details: String, id: Int, membership: Membership, name: String, updatedAt: Date, updatedById: Int?) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.details = details
        self.id = id
        self.membership = membership
        self.name = name
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

public enum Membership: String, Codable {
    case inviteOnly = "inviteOnly"
    case membershipOpen = "open"
    case membershipPrivate = "private"
}

/// Track
// MARK: - Track
public struct Track: Persisted, DataConvertible {
    public var artistName: String
    public var createdAt: Date
    public var createdById: Int?
    public var deletedAt: Date?
    public var deletedById: Int?
    public var durationMs: Int?
    public var explicit: Bool?
    public var href: String?
    public var id: Int
    public var isLocal: Bool?
    public var name: String?
    public var popularity: Int?
    public var previewUrl: String?
    public var thumbnailUrl: String
    public var title: String
    public var trackId: String
    public var trackNumber: Int?
    public var type: String?
    public var updatedAt: Date
    public var updatedById: Int?
    public var uri: String

    public enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case durationMs = "durationMs"
        case explicit = "explicit"
        case href = "href"
        case id = "id"
        case isLocal = "isLocal"
        case name = "name"
        case popularity = "popularity"
        case previewUrl = "previewUrl"
        case thumbnailUrl = "thumbnailUrl"
        case title = "title"
        case trackId = "trackId"
        case trackNumber = "trackNumber"
        case type = "type"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case uri = "uri"
    }

    public init(artistName: String, createdAt: Date, createdById: Int?, deletedAt: Date?, deletedById: Int?, durationMs: Int?, explicit: Bool?, href: String?, id: Int, isLocal: Bool?, name: String?, popularity: Int?, previewUrl: String?, thumbnailUrl: String, title: String, trackId: String, trackNumber: Int?, type: String?, updatedAt: Date, updatedById: Int?, uri: String) {
        self.artistName = artistName
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.durationMs = durationMs
        self.explicit = explicit
        self.href = href
        self.id = id
        self.isLocal = isLocal
        self.name = name
        self.popularity = popularity
        self.previewUrl = previewUrl
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

/// QueuedTrack
// MARK: - QueuedTrack
public struct QueuedTrack: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int?
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var musicroom: Musicroom?
    public var playEndedAt: Date?
    public var playStartedAt: Date?
    public var roomId: Int
    public var roomtrackId: Int
    public var track: Track?
    public var trackId: Int
    public var updatedAt: Date
    public var updatedById: Int?
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
        case roomId = "roomId"
        case roomtrackId = "roomtrackId"
        case track = "track"
        case trackId = "trackId"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case votes = "votes"
    }

    public init(createdAt: Date, createdById: Int?, deletedAt: Date?, deletedById: Int?, id: Int, musicroom: Musicroom?, playEndedAt: Date?, playStartedAt: Date?, roomId: Int, roomtrackId: Int, track: Track?, trackId: Int, updatedAt: Date, updatedById: Int?, votes: [QueuedTrackVote]?) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.musicroom = musicroom
        self.playEndedAt = playEndedAt
        self.playStartedAt = playStartedAt
        self.roomId = roomId
        self.roomtrackId = roomtrackId
        self.track = track
        self.trackId = trackId
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.votes = votes
    }
}

/// QueuedTrackVote
// MARK: - QueuedTrackVote
public struct QueuedTrackVote: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int?
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var queuedTrackId: Int
    public var updatedAt: Date
    public var updatedById: Int?

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

    public init(createdAt: Date, createdById: Int?, deletedAt: Date?, deletedById: Int?, id: Int, queuedTrackId: Int, updatedAt: Date, updatedById: Int?) {
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

/// Session
// MARK: - Session
public struct Session: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int?
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var token: String
    public var updatedAt: Date
    public var updatedById: Int?
    public var userId: Int

    public enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case id = "id"
        case token = "token"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
        case userId = "userId"
    }

    public init(createdAt: Date, createdById: Int?, deletedAt: Date?, deletedById: Int?, id: Int, token: String, updatedAt: Date, updatedById: Int?, userId: Int) {
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.id = id
        self.token = token
        self.updatedAt = updatedAt
        self.updatedById = updatedById
        self.userId = userId
    }
}

/// User
// MARK: - User
public struct User: Persisted, DataConvertible {
    public var activatedAt: Date?
    public var activeRoomId: Int?
    public var createdAt: Date
    public var createdById: Int?
    public var deletedAt: Date?
    public var deletedById: Int?
    public var djRanking: Int?
    public var email: String
    public var id: Int
    public var name: String
    public var passwordHash: String
    public var updatedAt: Date
    public var updatedById: Int?

    public enum CodingKeys: String, CodingKey {
        case activatedAt = "activatedAt"
        case activeRoomId = "activeRoomId"
        case createdAt = "createdAt"
        case createdById = "createdById"
        case deletedAt = "deletedAt"
        case deletedById = "deletedById"
        case djRanking = "djRanking"
        case email = "email"
        case id = "id"
        case name = "name"
        case passwordHash = "passwordHash"
        case updatedAt = "updatedAt"
        case updatedById = "updatedById"
    }

    public init(activatedAt: Date?, activeRoomId: Int?, createdAt: Date, createdById: Int?, deletedAt: Date?, deletedById: Int?, djRanking: Int?, email: String, id: Int, name: String, passwordHash: String, updatedAt: Date, updatedById: Int?) {
        self.activatedAt = activatedAt
        self.activeRoomId = activeRoomId
        self.createdAt = createdAt
        self.createdById = createdById
        self.deletedAt = deletedAt
        self.deletedById = deletedById
        self.djRanking = djRanking
        self.email = email
        self.id = id
        self.name = name
        self.passwordHash = passwordHash
        self.updatedAt = updatedAt
        self.updatedById = updatedById
    }
}

/// RoomMembership
// MARK: - RoomMembership
public struct RoomMembership: Persisted, DataConvertible {
    public var createdAt: Date
    public var createdById: Int?
    public var deletedAt: Date?
    public var deletedById: Int?
    public var id: Int
    public var inviteAcceptedAt: Int?
    public var invitedById: Int
    public var isAdmin: Int
    public var roomId: Int
    public var updatedAt: Date
    public var updatedById: Int?
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

    public init(createdAt: Date, createdById: Int?, deletedAt: Date?, deletedById: Int?, id: Int, inviteAcceptedAt: Int?, invitedById: Int, isAdmin: Int, roomId: Int, updatedAt: Date, updatedById: Int?, userId: Int) {
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