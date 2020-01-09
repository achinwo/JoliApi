//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 29/10/2019.
//

import Foundation
import Promises

public enum StringOrInt: Codable, Hashable {
    case string(String)
    case int(Int)
    
    public var  int: Int? {
        guard case let .int(int) = self else { return nil }
        return int
    }
    
    public var  string: String? {
        guard case let .string(val) = self else { return nil }
        return val
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let obj):
            try container.encode(obj)
        case .int(let id):
            try container.encode(id)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let id = try? container.decode(Int.self) {
            self = .int(id)
        } else if let obj = try? container.decode(String.self){
            self = .string(obj)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Data must be int or string")
        }
    }
}


public protocol IdIdentifiable: Codable, Hashable, Identifiable {
    var id: StringOrInt? { get set }
}

enum DbError: Error {
    case valueError(String)
}

protocol Trackable {
    
}


@propertyWrapper
public struct Tracked<T: Codable & Hashable>: Trackable, Codable, Hashable {
    
    public var projectedValue: T?
    private var currentValue: T?
    
    public var wrappedValue: T? {
        get { return currentValue }
        set {
            currentValue = newValue
        }
    }
    
    public init(wrappedValue: T?){
        currentValue = wrappedValue
        projectedValue = wrappedValue
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(currentValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        //debugPrint("field: \(String(describing: T.self)), isOptional: \(Tracked.isOptional(T.self))")
        
        self.init(wrappedValue: try? container.decode(T.self))
    }
}

public indirect enum ObjectOrId<T: IdIdentifiable>: Equatable, Codable, Hashable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .obj(let obj):
            try container.encode(obj)
        case .id(let id):
            try container.encode(id)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let id = try? container.decode(Int.self) {
            self = .id(id)
        } else if let obj = try? container.decode(T.self){
            self = .obj(obj)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Data must be int or Object")
        }
    }
    
    var id: StringOrInt? {
        switch self {
        case .obj(let obj):
            return obj.id
        case .id(let id):
            return .int(id)
        }
    }
    
    public var obj: T? {
        switch self {
        case .obj(let obj):
            return obj
        default:
            return nil
        }
    }
    
    case obj(T)
    case id(Int)
}

public protocol DataConvertible {
    func toData(outputFormatting: JSONEncoder.OutputFormatting?) throws -> Data
}

extension Encodable {

    public func toData(outputFormatting: JSONEncoder.OutputFormatting? = nil) throws -> Data {
        return try Musicroom.jsonEncoder(outputFormatting: outputFormatting ?? []).encode(self)
    }

}

// MARK: - Persistable
public protocol Persistable {
    associatedtype PersistedType: Persisted
    
    func save(baseUrl: URL?, urlSession: URLSession?, on: DispatchQueue?) -> Promise<PersistedType>
    
}


// MARK: - Persisted
public protocol Persisted: Identifiable, Codable, DataConvertible, Persistable, Hashable {
    
    associatedtype CodingKeys: CodingKey & Hashable
    
    typealias PropertiesDict = [Self.CodingKeys: AnyObject]
    
    var id: Int { get }
    
    var createdAt: Date { get }
    var updatedAt: Date { get }
    var deletedAt: Date? { get }
    
    var createdById: Int? { get }
    var updatedById: Int? { get }
    var deletedById: Int? { get }
    
}

extension Array where Element: Persisted {
    
    static func fromString(_ string: String) -> [Element]? {
        guard let stringData = string.data(using: .utf8) else {
            return nil
        }
        return try? Element.jsonDecoder().decode([Element].self, from: stringData)
    }
}

// MARK: - Builder
public struct Builder<T:Persisted>: Persistable {
    
    public let properties: T.PropertiesDict
    
    public var json: Json {
        let items: [(String, AnyObject)] = properties.map() { ($0.key.stringValue, $0.value) }
        return Dictionary<String, AnyObject>.init(uniqueKeysWithValues: items)
    }
    
    public init(properties: T.PropertiesDict? = nil){
        self.properties = properties ?? [:]
    }
    
    public func update(_ key: T.CodingKeys, _ value: AnyObject) -> Builder<T> {
        let newDict = self.properties.merging([key: value]) { $1 }
        return Builder<T>(properties: newDict)
    }
    
    public subscript<V>(_ key: T.CodingKeys, _ valueType: V.Type) -> V? {
        return properties[key] as? V
    }
    
    public func save(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<T> {
        let urlComp = "/api/db/\(T.className())"
        return HttpMethod.post.fetch(urlString: urlComp,
                                     dataType: T.self,
                                     payload: .json(self.json),
                                     baseUrl: baseUrl,
                                     urlSession: urlSession,
                                     on: on)
    }
}

// MARK: - Playable
public protocol Playable {
    //associatedtype Track: Playable = Never
    
    var explicit: Bool? { get }
    var title: String { get }
    var thumbnailUrl: String { get }
    var albumCoverUrl: String { get }
    var artistName: String { get }
    var uri: String { get }
    var isPlayable: Bool { get }
    var duration: Int? { get }
    func play(deviceId: String?, positionMs: Int?, baseUrl: URL?, urlSession: URLSession?, on: DispatchQueue?) -> Promise<Json>
}

//extension Playable where Playable.Track == Track {
//
//}

extension Playable {
    
    public var isPlayable: Bool {
        return true
    }
    
    @discardableResult
    public func play(deviceId: String?, positionMs: Int? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Json> {
            
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
        
        return HttpMethod.post.fetchJson(urlPath: urlPath, payload: payload, baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
}

public var BASE_URL: (ws: URL, http: URL)!

extension Persisted {
    
    public init(data: Data) throws {
        self = try Self.jsonDecoder().decode(Self.self, from: data)
    }

    public init(string: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = string.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    public init(url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    public static func build(_ json: Self.PropertiesDict? = nil) -> Builder<Self> {
        return Builder<Self>(properties: json)
    }
    
    public func builder() -> Builder<Self> {
        return Builder<Self>(properties: properties())
    }
    
    public func save(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Self> {
        let urlComp = "/api/db/\(Self.className())/\(id)"
        //return Self.post(urlPath: urlComp, dataType: Self?.self, payload: self, on: on)
        return HttpMethod.post.fetch(urlString: urlComp,
                                     dataType: Self.self,
                                     payload: .dbModel(self),
                                     baseUrl: baseUrl,
                                     urlSession: urlSession,
                                     on: on)
    }
    
    public static func fromJson(_ json: Json) -> Self? {
        let dec = Self.jsonDecoder()
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            return nil
        }
        return try? dec.decode(Self.self, from: data)
    }
    
    public func toData(outputFormatting: JSONEncoder.OutputFormatting? = nil) throws -> Data {
        return try Self.jsonEncoder(outputFormatting: outputFormatting ?? []).encode(self)
    }
    
    func propertyNames() -> [String] {
        return Mirror(reflecting: self).children.compactMap { $0.label }
    }
    
    public var description: String {
        var desc: String
        do {
            let data = try self.toData()
            desc = String(data: data, encoding: .utf8)!
        } catch {
            desc = "<Error: \(error.localizedDescription)>"
        }
        return "\(Self.className())(\(desc))"
    }
    
    @discardableResult
    public func delete(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Self> {
        
        let urlComp = "/api/db/\(Self.className())/\(id)"
        return HttpMethod.delete.fetch(urlString: urlComp,
                                     dataType: Self.self,
                                     baseUrl: baseUrl,
                                     urlSession: urlSession,
                                     on: on)
    }
    
    //192.168.1.132
    static var baseUrl: (ws: URL, http: URL) {
        get { BASE_URL }
//        get { (http:BASE_URL ?? URL(string: "http://192.168.1.173:8080")!,
//               ws:URL(string: "ws://192.168.1.173:8080")!)}
        set {
            BASE_URL = newValue
        }
    }
    
    static func jsonDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }
    
    static func jsonEncoder(outputFormatting: JSONEncoder.OutputFormatting = []) -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = outputFormatting
        return encoder
    }
    
    public func fetchUpdatedBy(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<User?> {
        return User.findById(id: id, baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public static func className() -> String {
        return String(describing: Self.self)
    }
    
    public static func all(where whereClause: PropertiesDict? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<[Self]> {
        var queryPath = URLComponents(string: "/api/db/\(Self.className())")!
        
        queryPath.queryItems = []
        for (key, val) in (whereClause ?? [:]){
            queryPath.queryItems?.append(URLQueryItem(name: key.stringValue, value: val as? String))
        }
        return HttpMethod.get.fetch(urlPath: queryPath, dataType: [Self].self, baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public static func findById(id: Int, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Self?> {
        return HttpMethod.get.fetch(urlString: "/api/db/\(Self.className())/\(id)",
            dataType: Self?.self, baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public static func findByIds(ids: [Int], baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<[Self]> {
        var comp = URLComponents(string: "/api/db/\(Self.className())")!
        comp.queryItems = [URLQueryItem(name: "ids", value: ids.map({$0.description}).joined(separator: ","))]
        
        return HttpMethod.get.fetch(urlPath: comp, dataType: [Self].self,
                                    baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    func properties() -> Self.PropertiesDict {
        var properties: Self.PropertiesDict = [:]
        guard let data = try? self.toData(),
            let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? Json else {
            fatalError("\(#file) - \(#function)")
        }
        
        for (key, val) in dictionary {
            guard let codingKey = CodingKeys.init(stringValue: key) else {
                continue
            }
            
            properties[codingKey] = val
        }
        
        return properties
    }
    
}

// MARK: - User
extension User: Discjockey {
    
    public var ranking: DiscjockeyPosition {
        return DiscjockeyPosition(rawValue: self.djRanking ?? 0) ?? DiscjockeyPosition.personal
    }
    
    public func fetchActiveRoom(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Musicroom?> {
        guard let roomId = self.activeRoomId else {
            return Promise(nil)
        }
        return Musicroom.findById(id: roomId, baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
//    public func setActiveRoom(_ , baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Musicroom?> {
//        guard let roomId = self.activeRoomId else {
//            return Promise(nil)
//        }
//        return Musicroom.findById(id: roomId, baseUrl: baseUrl, urlSession: urlSession, on: on)
//    }
    // get musicrooms
}

// MARK: - Session
extension Session{
    
    public static func fromCredentials(email: String, password: String, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Auth?> {
        let url = URLComponents(string: "/signin")!
        return HttpMethod.post.fetch(urlPath: url, dataType: Auth?.self,
                                     payload: .json(["email": email as AnyObject, "password": password as AnyObject]),
                                     baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public static func fromCredentials(token: String, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Auth?> {
        let url = URLComponents(string: "/signin")!
        return HttpMethod.post.fetch(urlPath: url, dataType: Auth?.self,
                                     payload: .json(["token": token as AnyObject]),
                                     baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
}

// MARK: - Musicroom
extension Musicroom {
    
    @discardableResult
    public func addTrack(_ track: Spotify.Track, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Json> {
        let urlPath = URLComponents(string: "/add_room_track")!
        let data = try! Self.jsonEncoder(outputFormatting: .prettyPrinted).encode(track)
        var payloadData = try! JSONSerialization.jsonObject(with: data, options: []) as! Json
        
        payloadData[Track.CodingKeys.artistName.stringValue] = track.artistName as AnyObject
        payloadData[Track.CodingKeys.title.stringValue] = track.title as AnyObject
        payloadData[Track.CodingKeys.thumbnailUrl.stringValue] = track.thumbnailUrl as AnyObject
        
        return HttpMethod.post.fetchJson(urlPath: urlPath, payload: ["roomId": id as AnyObject,
                                                        "track": payloadData as AnyObject],
                            baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    // get users
    // get tracks
    
    public func queueTrack(_ track: Playable, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<QueuedTrack>{
        
        let urlPath = "/api/musicrooms/\(id)/\(track.uri)"
        return HttpMethod.post.fetch(urlString: urlPath,
                                     dataType: QueuedTrack.self,
                                     baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public func fetchTracks(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<[Track]> {
        let urlPath = "/get_room_tracks"
        return HttpMethod.post.fetch(urlString: urlPath,
                                     dataType: [Track].self,
                                     payload: .json(["roomId": id as AnyObject]),
                                     baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
}

extension AuthToken {
    public var isExpired: Bool {
        let expiryTime = createdAt.addingTimeInterval(.init(expiresIn))
        return Date() >= expiryTime
    }
}

// MARK: - QueueTrack
extension QueuedTrack: Playable {
    
    public var duration: Int? {
        return self.track?.durationMs
    }
    
    public var isPlayable: Bool {
        return track != nil
    }
    
    public var explicit: Bool? {
        return track?.explicit
    }
    
    public var title: String {
        return track!.title
    }
    
    public var thumbnailUrl: String {
        return track!.thumbnailUrl
    }
    
    public var albumCoverUrl: String {
        return track!.albumCoverUrl
    }
    
    public var artistName: String {
        return track!.artistName
    }
    
    public var uri: String {
        return track!.uri
    }
    
    public func play(deviceId: String?, positionMs: Int? = nil, baseUrl: URL?  = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Json> {
        
        guard let track = track else {
            return Promise(NetworkError.badRequest("Track is null"))
        }
        
        var urlPath = URLComponents(string: "/api/spotify/play")!
        urlPath.queryItems = [
            URLQueryItem(name: "trackId", value: track.uri),
        ]
        
        if let deviceId = deviceId {
            urlPath.queryItems!.append(URLQueryItem(name: "deviceId", value: deviceId))
        }
        
        var payload: Json = [:]
        
        if let positionMs = positionMs {
            payload["position_ms"] = positionMs as AnyObject
        }
        
        return HttpMethod.post.fetchJson(urlPath: urlPath, payload: payload,
                                         baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
}

// MARK: - RoomTrack
extension RoomTrack: Playable {
    
    public var isPlayable: Bool {
        return track != nil
    }
    
    public var explicit: Bool? {
        return track?.explicit
    }
    
    public var duration: Int? {
        return track!.durationMs
    }
    
    public var title: String {
        return track!.title
    }
    
    public var thumbnailUrl: String {
        return track!.thumbnailUrl
    }
    
    public var albumCoverUrl: String {
        return track!.albumCoverUrl
    }
    
    public var artistName: String {
        return track!.artistName
    }
    
    public var uri: String {
        return track!.uri
    }
    
    public func play(deviceId: String?, positionMs: Int? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Json> {
        
        guard let track = track else {
            return Promise(NetworkError.badRequest("Track is null"))
        }
        
        var urlPath = URLComponents(string: "/api/spotify/play")!
        urlPath.queryItems = [
            URLQueryItem(name: "trackId", value: track.uri),
        ]
        
        if let deviceId = deviceId {
            urlPath.queryItems!.append(URLQueryItem(name: "deviceId", value: deviceId))
        }
        
        return HttpMethod.post.fetchJson(urlPath: urlPath, payload: [:],
                                         baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
        
}

// MARK: - Track

extension Track: Playable {
    
    public var duration: Int? {
        return self.durationMs
    }
    
    public var albumCoverUrl: String {
        return thumbnailUrl
    }
    
    public static func fromCurrentlyPlayingObject(_ json: Json) -> Builder<Track>? {
        
        guard let item = json["item"] as? Json, let name = item["name"], let id = item["id"] else {
            return nil
        }
        
        guard let artist: Json = (item["artists"] as? [Json])?[0], let artistName = artist["name"] else {
            return nil
        }
                
        guard let album = item["album"] as? Json,
            let img = (album["images"] as? [Json])?[1],
            let thumbnailUrl = img["url"] else {
            return nil
        }
        
        let props: PropertiesDict = [
            .title: name,
            .trackId: id,
            .thumbnailUrl: thumbnailUrl,
            .artistName: artistName,

            .durationMs: item["duration_ms"]!,
            .explicit: item["explicit"]!,
            .href: item["href"]!,

            .isLocal: item["is_local"]!,
            .name: name,
            .popularity: item["popularity"]!,
            .previewUrl: item["preview_url"]!,
            .trackNumber: item["track_number"]!,
            .type: item["type"]!,
            .uri: item["uri"]!
        ]
        
        return Track.build(props)
    }
    
    public func fetchCurrentlyPlaying(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil){
        
    }
    
}
