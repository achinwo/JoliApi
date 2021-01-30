/// Auto-generated
import Foundation

public typealias AuthTokenRecord = Builder<AuthToken>
public typealias UserRecord = Builder<User>
public typealias MusicroomRecord = Builder<Musicroom>
public typealias ArtistRecord = Builder<Artist>
public typealias RoomTrackRecord = Builder<RoomTrack>
public typealias TrackRecord = Builder<Track>
public typealias SessionRecord = Builder<Session>
public typealias QueuedTrackRecord = Builder<QueuedTrack>
public typealias QueuedTrackVoteRecord = Builder<QueuedTrackVote>
public typealias RoomMembershipRecord = Builder<RoomMembership>
public typealias DeviceRecord = Builder<Device>
public typealias PlayStateRecord = Builder<PlayState>
public typealias LogEntryRecord = Builder<LogEntry>
public typealias EntitlementRecord = Builder<Entitlement>


extension AuthTokenRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var accessToken: String? {
        get { properties[.accessToken] as? String}
        set { properties[.accessToken] = newValue as AnyObject }
    }
    public var expiresIn: Int? {
        get { properties[.expiresIn] as? Int}
        set { properties[.expiresIn] = newValue as AnyObject }
    }
    public var refreshToken: String? {
        get { properties[.refreshToken] as? String}
        set { properties[.refreshToken] = newValue as AnyObject }
    }
    public var scope: String? {
        get { properties[.scope] as? String}
        set { properties[.scope] = newValue as AnyObject }
    }
    public var tokenType: String? {
        get { properties[.tokenType] as? String}
        set { properties[.tokenType] = newValue as AnyObject }
    }
    public var country: String? {
        get { properties[.country] as? String}
        set { properties[.country] = newValue as AnyObject }
    }
    public var displayName: String? {
        get { properties[.displayName] as? String}
        set { properties[.displayName] = newValue as AnyObject }
    }
    public var email: String? {
        get { properties[.email] as? String}
        set { properties[.email] = newValue as AnyObject }
    }
    public var product: String? {
        get { properties[.product] as? String}
        set { properties[.product] = newValue as AnyObject }
    }
    public var userName: String? {
        get { properties[.userName] as? String}
        set { properties[.userName] = newValue as AnyObject }
    }
    public var roomId: Int? {
        get { properties[.roomId] as? Int}
        set { properties[.roomId] = newValue as AnyObject }
    }
    public var parentId: Int? {
        get { properties[.parentId] as? Int}
        set { properties[.parentId] = newValue as AnyObject }
    }
    
}
extension UserRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var name: String? {
        get { properties[.name] as? String}
        set { properties[.name] = newValue as AnyObject }
    }
    public var passwordHash: String? {
        get { properties[.passwordHash] as? String}
        set { properties[.passwordHash] = newValue as AnyObject }
    }
    public var email: String? {
        get { properties[.email] as? String}
        set { properties[.email] = newValue as AnyObject }
    }
    public var refreshTokenSpotify: String? {
        get { properties[.refreshTokenSpotify] as? String}
        set { properties[.refreshTokenSpotify] = newValue as AnyObject }
    }
    public var djRanking: Int? {
        get { properties[.djRanking] as? Int}
        set { properties[.djRanking] = newValue as AnyObject }
    }
    public var activeRoomId: Int? {
        get { properties[.activeRoomId] as? Int}
        set { properties[.activeRoomId] = newValue as AnyObject }
    }
    public var heartPoints: Int? {
        get { properties[.heartPoints] as? Int}
        set { properties[.heartPoints] = newValue as AnyObject }
    }
    public var isServiceAccount: Bool? {
        get { properties[.isServiceAccount] as? Bool}
        set { properties[.isServiceAccount] = newValue as AnyObject }
    }
    public var activeDeviceUuid: String? {
        get { properties[.activeDeviceUuid] as? String}
        set { properties[.activeDeviceUuid] = newValue as AnyObject }
    }
    public var activatedAt: Date? {
        get { properties[.activatedAt] as? Date}
        set { properties[.activatedAt] = newValue as AnyObject }
    }
    public var imageSmall: String? {
        get { properties[.imageSmall] as? String}
        set { properties[.imageSmall] = newValue as AnyObject }
    }
    public var imageMedium: String? {
        get { properties[.imageMedium] as? String}
        set { properties[.imageMedium] = newValue as AnyObject }
    }
    public var imageLarge: String? {
        get { properties[.imageLarge] as? String}
        set { properties[.imageLarge] = newValue as AnyObject }
    }
    public var playState: PlayState? {
        get { properties[.playState] as? PlayState}
        set { properties[.playState] = newValue as AnyObject }
    }
    
}
extension MusicroomRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var details: String? {
        get { properties[.details] as? String}
        set { properties[.details] = newValue as AnyObject }
    }
    public var name: String? {
        get { properties[.name] as? String}
        set { properties[.name] = newValue as AnyObject }
    }
    public var membership: String? {
        get { properties[.membership] as? String}
        set { properties[.membership] = newValue as AnyObject }
    }
    public var themeTrackUri: String? {
        get { properties[.themeTrackUri] as? String}
        set { properties[.themeTrackUri] = newValue as AnyObject }
    }
    public var themeTrackUri2: String? {
        get { properties[.themeTrackUri2] as? String}
        set { properties[.themeTrackUri2] = newValue as AnyObject }
    }
    public var refreshToken: String? {
        get { properties[.refreshToken] as? String}
        set { properties[.refreshToken] = newValue as AnyObject }
    }
    public var trackUri: String? {
        get { properties[.trackUri] as? String}
        set { properties[.trackUri] = newValue as AnyObject }
    }
    public var playlistUri: String? {
        get { properties[.playlistUri] as? String}
        set { properties[.playlistUri] = newValue as AnyObject }
    }
    public var snapshotId: String? {
        get { properties[.snapshotId] as? String}
        set { properties[.snapshotId] = newValue as AnyObject }
    }
    public var progressMs: Int? {
        get { properties[.progressMs] as? Int}
        set { properties[.progressMs] = newValue as AnyObject }
    }
    public var playingState: String? {
        get { properties[.playingState] as? String}
        set { properties[.playingState] = newValue as AnyObject }
    }
    public var playingStateChangedAt: Date? {
        get { properties[.playingStateChangedAt] as? Date}
        set { properties[.playingStateChangedAt] = newValue as AnyObject }
    }
    public var imageSmall: String? {
        get { properties[.imageSmall] as? String}
        set { properties[.imageSmall] = newValue as AnyObject }
    }
    public var imageMedium: String? {
        get { properties[.imageMedium] as? String}
        set { properties[.imageMedium] = newValue as AnyObject }
    }
    public var imageLarge: String? {
        get { properties[.imageLarge] as? String}
        set { properties[.imageLarge] = newValue as AnyObject }
    }
    public var entitlements: [Entitlement]? {
        get { properties[.entitlements] as? [Entitlement]}
        set { properties[.entitlements] = newValue as AnyObject }
    }
    public var voteCount: Int? {
        get { properties[.voteCount] as? Int}
        set { properties[.voteCount] = newValue as AnyObject }
    }
    public var createdByUser: User? {
        get { properties[.createdByUser] as? User}
        set { properties[.createdByUser] = newValue as AnyObject }
    }
    public var updatedByUser: User? {
        get { properties[.updatedByUser] as? User}
        set { properties[.updatedByUser] = newValue as AnyObject }
    }
    public var deletedByUser: User? {
        get { properties[.deletedByUser] as? User}
        set { properties[.deletedByUser] = newValue as AnyObject }
    }
    
}
extension ArtistRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var artistId: String? {
        get { properties[.artistId] as? String}
        set { properties[.artistId] = newValue as AnyObject }
    }
    public var href: String? {
        get { properties[.href] as? String}
        set { properties[.href] = newValue as AnyObject }
    }
    public var name: String? {
        get { properties[.name] as? String}
        set { properties[.name] = newValue as AnyObject }
    }
    public var uri: String? {
        get { properties[.uri] as? String}
        set { properties[.uri] = newValue as AnyObject }
    }
    public var popularity: Int? {
        get { properties[.popularity] as? Int}
        set { properties[.popularity] = newValue as AnyObject }
    }
    public var followersTotal: Int? {
        get { properties[.followersTotal] as? Int}
        set { properties[.followersTotal] = newValue as AnyObject }
    }
    public var imageSmall: String? {
        get { properties[.imageSmall] as? String}
        set { properties[.imageSmall] = newValue as AnyObject }
    }
    public var imageMedium: String? {
        get { properties[.imageMedium] as? String}
        set { properties[.imageMedium] = newValue as AnyObject }
    }
    public var imageLarge: String? {
        get { properties[.imageLarge] as? String}
        set { properties[.imageLarge] = newValue as AnyObject }
    }
    
}
extension RoomTrackRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var addedBy: Int? {
        get { properties[.addedBy] as? Int}
        set { properties[.addedBy] = newValue as AnyObject }
    }
    public var roomId: Int? {
        get { properties[.roomId] as? Int}
        set { properties[.roomId] = newValue as AnyObject }
    }
    public var trackId: Int? {
        get { properties[.trackId] as? Int}
        set { properties[.trackId] = newValue as AnyObject }
    }
    public var track: Track? {
        get { properties[.track] as? Track}
        set { properties[.track] = newValue as AnyObject }
    }
    public var musicroom: Musicroom? {
        get { properties[.musicroom] as? Musicroom}
        set { properties[.musicroom] = newValue as AnyObject }
    }
    
}
extension TrackRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var title: String? {
        get { properties[.title] as? String}
        set { properties[.title] = newValue as AnyObject }
    }
    public var trackId: String? {
        get { properties[.trackId] as? String}
        set { properties[.trackId] = newValue as AnyObject }
    }
    public var thumbnailUrl: String? {
        get { properties[.thumbnailUrl] as? String}
        set { properties[.thumbnailUrl] = newValue as AnyObject }
    }
    public var isrc: String? {
        get { properties[.isrc] as? String}
        set { properties[.isrc] = newValue as AnyObject }
    }
    public var albumId: String? {
        get { properties[.albumId] as? String}
        set { properties[.albumId] = newValue as AnyObject }
    }
    public var artistName: String? {
        get { properties[.artistName] as? String}
        set { properties[.artistName] = newValue as AnyObject }
    }
    public var imageSmall: String? {
        get { properties[.imageSmall] as? String}
        set { properties[.imageSmall] = newValue as AnyObject }
    }
    public var imageMedium: String? {
        get { properties[.imageMedium] as? String}
        set { properties[.imageMedium] = newValue as AnyObject }
    }
    public var imageLarge: String? {
        get { properties[.imageLarge] as? String}
        set { properties[.imageLarge] = newValue as AnyObject }
    }
    public var durationMs: Int? {
        get { properties[.durationMs] as? Int}
        set { properties[.durationMs] = newValue as AnyObject }
    }
    public var explicit: Bool? {
        get { properties[.explicit] as? Bool}
        set { properties[.explicit] = newValue as AnyObject }
    }
    public var href: String? {
        get { properties[.href] as? String}
        set { properties[.href] = newValue as AnyObject }
    }
    public var isLocal: Bool? {
        get { properties[.isLocal] as? Bool}
        set { properties[.isLocal] = newValue as AnyObject }
    }
    public var name: String? {
        get { properties[.name] as? String}
        set { properties[.name] = newValue as AnyObject }
    }
    public var popularity: Int? {
        get { properties[.popularity] as? Int}
        set { properties[.popularity] = newValue as AnyObject }
    }
    public var previewUrl: String? {
        get { properties[.previewUrl] as? String}
        set { properties[.previewUrl] = newValue as AnyObject }
    }
    public var trackNumber: Int? {
        get { properties[.trackNumber] as? Int}
        set { properties[.trackNumber] = newValue as AnyObject }
    }
    public var type: String? {
        get { properties[.type] as? String}
        set { properties[.type] = newValue as AnyObject }
    }
    public var uri: String? {
        get { properties[.uri] as? String}
        set { properties[.uri] = newValue as AnyObject }
    }
    public var releaseDate: Date? {
        get { properties[.releaseDate] as? Date}
        set { properties[.releaseDate] = newValue as AnyObject }
    }
    public var releaseDatePrecision: String? {
        get { properties[.releaseDatePrecision] as? String}
        set { properties[.releaseDatePrecision] = newValue as AnyObject }
    }
    public var colorPrimary: String? {
        get { properties[.colorPrimary] as? String}
        set { properties[.colorPrimary] = newValue as AnyObject }
    }
    public var colorSecondary: String? {
        get { properties[.colorSecondary] as? String}
        set { properties[.colorSecondary] = newValue as AnyObject }
    }
    public var colorBackground: String? {
        get { properties[.colorBackground] as? String}
        set { properties[.colorBackground] = newValue as AnyObject }
    }
    public var colorDetail: String? {
        get { properties[.colorDetail] as? String}
        set { properties[.colorDetail] = newValue as AnyObject }
    }
    
}
extension SessionRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var token: String? {
        get { properties[.token] as? String}
        set { properties[.token] = newValue as AnyObject }
    }
    public var userId: Int? {
        get { properties[.userId] as? Int}
        set { properties[.userId] = newValue as AnyObject }
    }
    public var deviceUuid: String? {
        get { properties[.deviceUuid] as? String}
        set { properties[.deviceUuid] = newValue as AnyObject }
    }
    
}
extension QueuedTrackRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var roomtrackId: Int? {
        get { properties[.roomtrackId] as? Int}
        set { properties[.roomtrackId] = newValue as AnyObject }
    }
    public var trackId: Int? {
        get { properties[.trackId] as? Int}
        set { properties[.trackId] = newValue as AnyObject }
    }
    public var roomId: Int? {
        get { properties[.roomId] as? Int}
        set { properties[.roomId] = newValue as AnyObject }
    }
    public var progressMsStored: Int? {
        get { properties[.progressMsStored] as? Int}
        set { properties[.progressMsStored] = newValue as AnyObject }
    }
    public var playStartedAt: Date? {
        get { properties[.playStartedAt] as? Date}
        set { properties[.playStartedAt] = newValue as AnyObject }
    }
    public var playEndedAt: Date? {
        get { properties[.playEndedAt] as? Date}
        set { properties[.playEndedAt] = newValue as AnyObject }
    }
    public var track: Track? {
        get { properties[.track] as? Track}
        set { properties[.track] = newValue as AnyObject }
    }
    public var musicroom: Musicroom? {
        get { properties[.musicroom] as? Musicroom}
        set { properties[.musicroom] = newValue as AnyObject }
    }
    public var votes: [QueuedTrackVote]? {
        get { properties[.votes] as? [QueuedTrackVote]}
        set { properties[.votes] = newValue as AnyObject }
    }
    
}
extension QueuedTrackVoteRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var queuedTrackId: Int? {
        get { properties[.queuedTrackId] as? Int}
        set { properties[.queuedTrackId] = newValue as AnyObject }
    }
    
}
extension RoomMembershipRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var userId: Int? {
        get { properties[.userId] as? Int}
        set { properties[.userId] = newValue as AnyObject }
    }
    public var roomId: Int? {
        get { properties[.roomId] as? Int}
        set { properties[.roomId] = newValue as AnyObject }
    }
    public var invitedById: Int? {
        get { properties[.invitedById] as? Int}
        set { properties[.invitedById] = newValue as AnyObject }
    }
    public var inviteAcceptedAt: Int? {
        get { properties[.inviteAcceptedAt] as? Int}
        set { properties[.inviteAcceptedAt] = newValue as AnyObject }
    }
    public var isAdmin: Int? {
        get { properties[.isAdmin] as? Int}
        set { properties[.isAdmin] = newValue as AnyObject }
    }
    
}
extension DeviceRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var uuid: String? {
        get { properties[.uuid] as? String}
        set { properties[.uuid] = newValue as AnyObject }
    }
    public var platform: String? {
        get { properties[.platform] as? String}
        set { properties[.platform] = newValue as AnyObject }
    }
    public var model: String? {
        get { properties[.model] as? String}
        set { properties[.model] = newValue as AnyObject }
    }
    public var name: String? {
        get { properties[.name] as? String}
        set { properties[.name] = newValue as AnyObject }
    }
    public var apnToken: String? {
        get { properties[.apnToken] as? String}
        set { properties[.apnToken] = newValue as AnyObject }
    }
    public var refreshToken: String? {
        get { properties[.refreshToken] as? String}
        set { properties[.refreshToken] = newValue as AnyObject }
    }
    
}
extension PlayStateRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var accessToken: String? {
        get { properties[.accessToken] as? String}
        set { properties[.accessToken] = newValue as AnyObject }
    }
    public var expiresIn: Int? {
        get { properties[.expiresIn] as? Int}
        set { properties[.expiresIn] = newValue as AnyObject }
    }
    public var scope: String? {
        get { properties[.scope] as? String}
        set { properties[.scope] = newValue as AnyObject }
    }
    public var tokenType: String? {
        get { properties[.tokenType] as? String}
        set { properties[.tokenType] = newValue as AnyObject }
    }
    public var country: String? {
        get { properties[.country] as? String}
        set { properties[.country] = newValue as AnyObject }
    }
    public var displayName: String? {
        get { properties[.displayName] as? String}
        set { properties[.displayName] = newValue as AnyObject }
    }
    public var email: String? {
        get { properties[.email] as? String}
        set { properties[.email] = newValue as AnyObject }
    }
    public var product: String? {
        get { properties[.product] as? String}
        set { properties[.product] = newValue as AnyObject }
    }
    public var userName: String? {
        get { properties[.userName] as? String}
        set { properties[.userName] = newValue as AnyObject }
    }
    public var roomId: Int? {
        get { properties[.roomId] as? Int}
        set { properties[.roomId] = newValue as AnyObject }
    }
    public var refreshToken: String? {
        get { properties[.refreshToken] as? String}
        set { properties[.refreshToken] = newValue as AnyObject }
    }
    public var trackUri: String? {
        get { properties[.trackUri] as? String}
        set { properties[.trackUri] = newValue as AnyObject }
    }
    public var prevTrackUri: String? {
        get { properties[.prevTrackUri] as? String}
        set { properties[.prevTrackUri] = newValue as AnyObject }
    }
    public var prevPlaylistUri: String? {
        get { properties[.prevPlaylistUri] as? String}
        set { properties[.prevPlaylistUri] = newValue as AnyObject }
    }
    public var playlistUri: String? {
        get { properties[.playlistUri] as? String}
        set { properties[.playlistUri] = newValue as AnyObject }
    }
    public var deviceUid: String? {
        get { properties[.deviceUid] as? String}
        set { properties[.deviceUid] = newValue as AnyObject }
    }
    public var progressMs: Int? {
        get { properties[.progressMs] as? Int}
        set { properties[.progressMs] = newValue as AnyObject }
    }
    public var durationMs: Int? {
        get { properties[.durationMs] as? Int}
        set { properties[.durationMs] = newValue as AnyObject }
    }
    public var playingState: String? {
        get { properties[.playingState] as? String}
        set { properties[.playingState] = newValue as AnyObject }
    }
    public var playingStateChangedAt: Date? {
        get { properties[.playingStateChangedAt] as? Date}
        set { properties[.playingStateChangedAt] = newValue as AnyObject }
    }
    public var status: String? {
        get { properties[.status] as? String}
        set { properties[.status] = newValue as AnyObject }
    }
    public var statusChangedAt: Date? {
        get { properties[.statusChangedAt] as? Date}
        set { properties[.statusChangedAt] = newValue as AnyObject }
    }
    
}
extension LogEntryRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var line: String? {
        get { properties[.line] as? String}
        set { properties[.line] = newValue as AnyObject }
    }
    public var deviceName: String? {
        get { properties[.deviceName] as? String}
        set { properties[.deviceName] = newValue as AnyObject }
    }
    public var platform: String? {
        get { properties[.platform] as? String}
        set { properties[.platform] = newValue as AnyObject }
    }
    
}
extension EntitlementRecord {
    
    public var createdById: Int? {
        get { properties[.createdById] as? Int}
        set { properties[.createdById] = newValue as AnyObject }
    }
    public var deletedById: Int? {
        get { properties[.deletedById] as? Int}
        set { properties[.deletedById] = newValue as AnyObject }
    }
    public var updatedById: Int? {
        get { properties[.updatedById] as? Int}
        set { properties[.updatedById] = newValue as AnyObject }
    }
    public var createdAt: Date? {
        get { properties[.createdAt] as? Date}
        set { properties[.createdAt] = newValue as AnyObject }
    }
    public var deletedAt: Date? {
        get { properties[.deletedAt] as? Date}
        set { properties[.deletedAt] = newValue as AnyObject }
    }
    public var updatedAt: Date? {
        get { properties[.updatedAt] as? Date}
        set { properties[.updatedAt] = newValue as AnyObject }
    }
    public var userId: Int? {
        get { properties[.userId] as? Int}
        set { properties[.userId] = newValue as AnyObject }
    }
    public var type: String? {
        get { properties[.type] as? String}
        set { properties[.type] = newValue as AnyObject }
    }
    public var targetRecordId: Int? {
        get { properties[.targetRecordId] as? Int}
        set { properties[.targetRecordId] = newValue as AnyObject }
    }
    public var acceptedAt: Date? {
        get { properties[.acceptedAt] as? Date}
        set { properties[.acceptedAt] = newValue as AnyObject }
    }
    public var expiresAt: Date? {
        get { properties[.expiresAt] as? Date}
        set { properties[.expiresAt] = newValue as AnyObject }
    }
    public var user: User? {
        get { properties[.user] as? User}
        set { properties[.user] = newValue as AnyObject }
    }
    
}

            