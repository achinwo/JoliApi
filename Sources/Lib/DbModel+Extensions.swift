//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 29/10/2019.
//

import Foundation
import Promises
import UIImageColors

#if os(OSX)
    import AppKit
    public typealias UIImage = NSImage
    public typealias UIColor = NSColor
#else
    import UIKit
#endif

public protocol HttpApi {
    
    var baseUrlHttp: URL { get }
    var baseUrlWs: URL { get }
    var urlSession: URLSession { get }
    var user: User? { get }
    
}

extension HttpApi {
    
    public static func setDefault(_ api: HttpApi) {
        LocalhostApi.default = api
    }
    
}

struct LocalhostApi: HttpApi {
    
    var baseUrlHttp: URL {
        return URL(string: "https://localhost:8080")!
    }
    
    var baseUrlWs: URL {
        return URL(string: "https://localhost:8080")!
    }
    
    var urlSession: URLSession = URLSession.shared
    
    var user: User? = nil
    
    public static var `default`: HttpApi = LocalhostApi()
}

public extension UIColor {
    
    convenience init(hexString: String) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    var hexString: String {
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
        
        return String(format: "#%06x", rgb)
    }
}

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
    
    public static func fromString(_ string: String) -> [Element]? {
        guard let stringData = string.data(using: .utf8) else {
            return nil
        }
        do {
            return try Element.jsonDecoder().decode([Element].self, from: stringData)
        } catch {
            debugPrint("[\(Element.className())#fromString] error:\(error)")
            return nil
        }
    }
}

@propertyWrapper
enum Lazy<Value> {
  case uninitialized(() -> Value)
  case initialized(Value)

  init(wrappedValue: @autoclosure @escaping () -> Value) {
    self = .uninitialized(wrappedValue)
  }

  var wrappedValue: Value {
    mutating get {
      switch self {
      case .uninitialized(let initializer):
        let value = initializer()
        self = .initialized(value)
        return value
      case .initialized(let value):
        return value
      }
    }
    set {
      self = .initialized(newValue)
    }
  }
}

// MARK: - Builder
public struct Builder<T: Persisted>: Persistable, Identifiable, Equatable {
    
    public static func == (lhs: Builder<T>, rhs: Builder<T>) -> Bool {
        guard let lhsId = lhs.id, let rhsId = rhs.id else {
            return false
        }
        
        return lhsId == rhsId
    }
    
    public var properties: T.PropertiesDict
    
    public var id: Int? = nil
    
    public var json: Json {
        let items: [(String, AnyObject)] = properties.map() { ($0.key.stringValue, $0.value) }
        return Dictionary<String, AnyObject>.init(uniqueKeysWithValues: items)
    }
    
    public init(properties: T.PropertiesDict? = nil, id: Int? = nil){
        self.properties = properties ?? [:]
        self.id = id
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
        //"/api/db/\(T.className())"
        return HttpMethod.Fetch.post(url: urlComp,
                                     dataType: T.self,
                                     payload: .json(self.json),
                                     baseUrl: baseUrl,
                                     urlSession: urlSession,
                                     on: on)
    }
}


//extension DefaultStringInterpolation {
//    mutating func appendInterpolation(_ value: )
//    {
//
//        self.appendInterpolation(
//            dateComponents.value(for: component)!
//        )
//    }
//}

enum Endpoint {
    
}


//extension Playable where Playable.Track == Track {
//
//}


public var BASE_URL: (http: URL, ws: URL)!

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
    
    public static func build(_ json: Self.PropertiesDict? = nil, id: Int? = nil) -> Builder<Self> {
        return Builder<Self>(properties: json, id: id)
    }
    
    public func builder() -> Builder<Self> {
        return Builder<Self>(properties: properties(), id: id)
    }
    
    public func save(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Self> {
        let urlComp = "/api/db/\(Self.className())/\(id)"
        //return Self.post(urlPath: urlComp, dataType: Self?.self, payload: self, on: on)
        return HttpMethod.Fetch.post(url: urlComp,
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
        return HttpMethod.Fetch.delete(url: urlComp,
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
        //decoder.dateDecodingStrategy = .iso8601

        let formatter = DateFormatter()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            for dateFormat in ["yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", "yyyy-MM-dd'T'HH:mm:ss'Z'"] {
                formatter.dateFormat = dateFormat
                guard let date = formatter.date(from: dateString) else {
                    continue
                }
                
                return date
            }
            
            throw DecodingError.dataCorruptedError(in: container,
                debugDescription: "Cannot decode date string \(dateString)")
        }
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }
    
    static func jsonEncoder(outputFormatting: JSONEncoder.OutputFormatting = []) -> JSONEncoder {
        let encoder = JSONEncoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        encoder.dateEncodingStrategy = .formatted(formatter)
        encoder.outputFormatting = outputFormatting
        return encoder
    }
    
    public func fetchUpdatedBy(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<User?> {
        return User.findById(id: id, baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public static func className() -> String {
        return String(describing: Self.self)
    }
    
    public static func all(where whereClause: PropertiesDict? = nil, limit: Int? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<[Self]> {
        var queryPath = URLComponents(string: "/api/db/\(Self.className())")!
        
        queryPath.queryItems = []
        for (key, val) in (whereClause ?? [:]){
            queryPath.queryItems?.append(URLQueryItem(name: key.stringValue, value: val as? String))
        }
        
        if let limit = limit {
            queryPath.queryItems?.append(URLQueryItem(name: "limit", value: String(limit)))
        }
        
        return HttpMethod.Fetch.get(url: queryPath, dataType: [Self].self, baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public static func findById(id: Int, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Self?> {
        return HttpMethod.Fetch.get(url: "/api/db/\(Self.className())/\(id)",
            dataType: Self?.self, baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public static func findByIds(ids: [Int], baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<[Self]> {
        var comp = URLComponents(string: "/api/db/\(Self.className())")!
        comp.queryItems = [URLQueryItem(name: "ids", value: ids.map({$0.description}).joined(separator: ","))]
        
        return HttpMethod.Fetch.get(url: comp, dataType: [Self].self,
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
        return HttpMethod.Fetch.post(url: url, dataType: Auth?.self,
                                     payload: .json(["email": email as AnyObject, "password": password as AnyObject]),
                                     baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public static func fromCredentials(token: String, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<Auth?> {
        let url = URLComponents(string: "/signin")!
        return HttpMethod.Fetch.post(url: url, dataType: Auth?.self,
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
        return HttpMethod.Fetch.post(url: urlPath,
                                     dataType: QueuedTrack.self,
                                     baseUrl: baseUrl, urlSession: urlSession, on: on)
    }
    
    public func fetchTracks(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<[Track]> {
        let urlPath = "/get_room_tracks"
        return HttpMethod.Fetch.post(url: urlPath,
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
    
    public func play(deviceId: String?, positionMs: Int? = nil, baseUrl: URL?  = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<PlayState> {
        
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
        
        return HttpMethod.Fetch.post(url: urlPath, dataType: PlayState.self, payload: .json(payload),
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
    
    public func play(deviceId: String?, positionMs: Int? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) -> Promise<PlayState> {
        
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
        
        return HttpMethod.Fetch.post(url: urlPath, dataType: PlayState.self, payload: .json(payload),
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
