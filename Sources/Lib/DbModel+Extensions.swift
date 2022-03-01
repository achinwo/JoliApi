//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 29/10/2019.
//

import Foundation
import UIImageColors
import SwiftUI

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

public extension Data {
    
    var countMb: Double {
        return Double(count) / (1024 * 1024)
    }
    
    var sizeFormatted: String {
        return self.sizeFormatted([.useMB])
    }
    
    func sizeFormatted(_ allowedUnits: ByteCountFormatter.Units = [.useMB], countStyle: ByteCountFormatter.CountStyle = .file) -> String {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = allowedUnits // optional: restricts the units to MB only
        bcf.countStyle = countStyle
        return bcf.string(fromByteCount: Int64(count))
    }
        
    mutating func append(_ string: String) {
        guard let data = string.data(using: .utf8) else {
          return
        }
        
        self.append(data)
    }
    
}

public extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
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
    
    convenience init(hex: String) {
        let rgba = Color.rgbaFrom(hex: hex)
        self.init(red: CGFloat(rgba.red), green: CGFloat(rgba.green), blue: CGFloat(rgba.blue), alpha: CGFloat(rgba.alpha))
    }
}

public extension Color {
    
    var hexString: String {
        return UIColor(self).hexString
    }
    
    static func rgbaFrom(hex: String) -> (red: Double, green: Double, blue: Double, alpha: Double) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = .zero
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        return (
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            alpha: Double(a) / 255
        )
    }
    
    init(hex: String) {
        let rgba = Self.rgbaFrom(hex: hex)
        
        self.init(
            .sRGB,
            red: rgba.red,
            green: rgba.green,
            blue: rgba.blue,
            opacity: rgba.alpha
        )
    }
}

extension Color: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.hexString)
    }
    
}

extension Color: Decodable {
    
    public init(from decoder: Decoder) throws {
        let hex = try decoder.singleValueContainer().decode(String.self)
        self.init(hex: hex)
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
    
    var json: Json { get }
    func save(baseUrl: URL?, urlSession: URLSession?) async throws -> PersistedType
    
}

public extension Persistable {
    
    var json: Json {
        return [:]
    }
    
}


// MARK: - Persisted
public protocol Persisted: Identifiable, Codable, DataConvertible, Persistable, Hashable, CustomStringConvertible {
    
    associatedtype CodingKeys: CodingKey & Hashable
    
    typealias PropertiesDict = [Self.CodingKeys: AnyObject]
    
    var id: Int { get }
    
    var createdAt: Date { get }
    var updatedAt: Date { get }
    var deletedAt: Date? { get }
    
    var createdById: Int { get }
    var updatedById: Int { get }
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
    
    public func save(baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> T {
        let urlComp = "/api/db/\(T.className())"
        //"/api/db/\(T.className())"
        return try await HttpMethod.Fetch.post(url: urlComp,
                                     dataType: T.self,
                                     payload: .json(self.json),
                                     baseUrl: baseUrl,
                                     urlSession: urlSession)
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
    
    public func save(baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> Self {
        let urlComp = "/api/db/\(Self.className())/\(id)"
        //return Self.post(urlPath: urlComp, dataType: Self?.self, payload: self, on: on)
        return try await HttpMethod.Fetch.post(url: urlComp,
                                     dataType: Self.self,
                                     payload: .dbModel(self),
                                     baseUrl: baseUrl,
                                     urlSession: urlSession)
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
    
    public func propertyNames() -> [String] {
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
    public func delete(baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> Self {
        
        let urlComp = "/api/db/\(Self.className())/\(id)"
        return try await HttpMethod.Fetch.delete(url: urlComp,
                                     dataType: Self.self,
                                     baseUrl: baseUrl,
                                     urlSession: urlSession)
    }
    
    //192.168.1.132
    static var baseUrl: (http: URL, ws: URL) {
        get { BASE_URL }
//        get { (http:BASE_URL ?? URL(string: "http://192.168.1.173:8080")!,
//               ws:URL(string: "ws://192.168.1.173:8080")!)}
        set {
            BASE_URL = newValue
        }
    }
    
    public static func jsonDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        //decoder.dateDecodingStrategy = .iso8601

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            for dateFormat in ["yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", "yyyy-MM-dd'T'HH:mm:ssZ"] {//2021-03-28T01:12:01Z
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
    
    public static func jsonEncoder(outputFormatting: JSONEncoder.OutputFormatting = []) -> JSONEncoder {
        let encoder = JSONEncoder()
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        encoder.dateEncodingStrategy = .formatted(formatter)
        encoder.outputFormatting = outputFormatting
        return encoder
    }
    
    public func fetchUpdatedBy(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> User? {
        return try await User.findById(id: id, baseUrl: baseUrl, urlSession: urlSession)
    }
    
    public static func className() -> String {
        return String(describing: Self.self)
    }
    
    public static func all(where whereClause: PropertiesDict? = nil, limit: Int? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> [Self] {
        var queryPath = URLComponents(string: "/api/db/\(Self.className())")!
        
        queryPath.queryItems = []
        for (key, val) in (whereClause ?? [:]){
            queryPath.queryItems?.append(URLQueryItem(name: key.stringValue, value: val as? String))
        }
        
        if let limit = limit {
            queryPath.queryItems?.append(URLQueryItem(name: "limit", value: String(limit)))
        }
        
        return try await HttpMethod.Fetch.get(url: queryPath, dataType: [Self].self, baseUrl: baseUrl, urlSession: urlSession)
    }
    
    public static func findById(id: Int, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> Self? {
        return try await HttpMethod.Fetch.get(url: "/api/db/\(Self.className())/\(id)",
            dataType: Self?.self, baseUrl: baseUrl, urlSession: urlSession)
    }
    
    public static func findByIds(ids: [Int], baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> [Self] {
        var comp = URLComponents(string: "/api/db/\(Self.className())")!
        comp.queryItems = [URLQueryItem(name: "ids", value: ids.map({$0.description}).joined(separator: ","))]
        
        return try await HttpMethod.Fetch.get(url: comp, dataType: [Self].self,
                                    baseUrl: baseUrl, urlSession: urlSession)
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
    
    public func fetchActiveRoom(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> Musicroom? {
        guard let roomId = self.activeRoomId else {
            return nil
        }
        return try await Musicroom.findById(id: roomId, baseUrl: baseUrl, urlSession: urlSession)
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
    
    public static func fromCredentials(email: String, password: String, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> Auth? {
        let url = URLComponents(string: "/signin")!
        return try await HttpMethod.Fetch.post(url: url, dataType: Auth?.self,
                                     payload: .json(["email": email as AnyObject, "password": password as AnyObject]),
                                     baseUrl: baseUrl, urlSession: urlSession)
    }
    
    public static func fromCredentials(token: String, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> Auth? {
        let url = URLComponents(string: "/signin")!
        return try await HttpMethod.Fetch.post(url: url, dataType: Auth?.self,
                                     payload: .json(["token": token as AnyObject]),
                                     baseUrl: baseUrl, urlSession: urlSession)
    }
    
    public static func fromCredentials(spotifyRefreshToken: String, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> Auth? {
        let url = URLComponents(string: "/signin")!
        return try await HttpMethod.Fetch.post(url: url, dataType: Auth?.self,
                                     payload: .json(["spotifyRefreshToken": spotifyRefreshToken as AnyObject]),
                                     baseUrl: baseUrl, urlSession: urlSession)
    }
    
    public static func fromCredentials(name: String, email: String, userId: String, idToken: String, authCode: String, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> Auth? {
        let url = URLComponents(string: "/signin")!
        return try await HttpMethod.Fetch.post(url: url, dataType: Auth?.self,
                                     payload: .json([
                                        "name": name as AnyObject,
                                        "email": email as AnyObject,
                                        "userId": userId as AnyObject,
                                        "idToken": idToken as AnyObject,
                                        "authCode": authCode as AnyObject,
                                     ]),
                                     baseUrl: baseUrl, urlSession: urlSession)
    }
    
}

// MARK: - Musicroom
extension Musicroom {
    
    @discardableResult
    public func addTrack(_ track: Spotify.Track, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> Json {
        let urlPath = URLComponents(string: "/add_room_track")!
        let data = try! Self.jsonEncoder(outputFormatting: .prettyPrinted).encode(track)
        var payloadData = try! JSONSerialization.jsonObject(with: data, options: []) as! Json
        
        payloadData[Track.CodingKeys.artistName.stringValue] = track.artistName as AnyObject
        payloadData[Track.CodingKeys.title.stringValue] = track.title as AnyObject
        payloadData[Track.CodingKeys.thumbnailUrl.stringValue] = track.thumbnailUrl as AnyObject
        
        return try await HttpMethod.post.fetchJson(urlPath: urlPath, payload: ["roomId": id as AnyObject,
                                                        "track": payloadData as AnyObject],
                            baseUrl: baseUrl, urlSession: urlSession)
    }
    
    // get users
    // get tracks
    
    public func queueTrack(_ track: Playable, baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> QueuedTrack {
        
        let urlPath = "/api/musicrooms/\(id)/\(track.uri)"
        return try await HttpMethod.Fetch.post(url: urlPath,
                                     dataType: QueuedTrack.self,
                                     baseUrl: baseUrl, urlSession: urlSession)
    }
    
    public func fetchTracks(baseUrl: URL? = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> [Track] {
        let urlPath = "/get_room_tracks"
        return try await HttpMethod.Fetch.post(url: urlPath,
                                     dataType: [Track].self,
                                     payload: .json(["roomId": id as AnyObject]),
                                     baseUrl: baseUrl, urlSession: urlSession)
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
    
    public var releasedAt: Date? {
        return track?.releaseDate
    }
    
    public var duration: Int {
        return self.track!.durationMs
    }
    
    public var isPlayable: Bool {
        return track != nil
    }
    
    public var explicit: Bool {
        return track!.explicit
    }
    
    public var title: String {
        return track!.title
    }
    
    public var thumbnailUrl: String {
        return track!.thumbnailUrl
    }
    
    public var albumCoverUrl: String {
        return track!.imageMedium
    }
    
    public var artistName: String {
        return track!.artistName
    }
    
    public var uri: String {
        return track!.uri
    }
    
    public func play(deviceId: String?, positionMs: Int? = nil, offset: ContentOffset? = nil, baseUrl: URL?  = nil, urlSession: URLSession? = nil, on: DispatchQueue? = nil) async throws -> PlayState {
        
        guard let track = track else {
            throw NetworkError.badRequest("Track is null")
        }
        
        return try await Self.playContent(track.uri, deviceId: deviceId, positionMs: positionMs, offset: offset, baseUrl: baseUrl, urlSession: urlSession)
    }
    
}

extension PlayState: Playable {
    
    public var explicit: Bool {
        track!.explicit
    }
    
    public var title: String {
        track!.title
    }
    
    public var thumbnailUrl: String {
        track!.thumbnailUrl
    }
    
    public var albumCoverUrl: String {
        track!.imageMedium
    }
    
    public var artistName: String {
        track!.artistName
    }
    
    public var uri: String {
        track!.uri
    }
    
    public var duration: Int {
        track!.duration
    }
    
    public var isPlayable: Bool {
        return track != nil
    }
    
    public var releasedAt: Date? {
        return track?.releaseDate
    }
    
}


// MARK: - RoomTrack
extension RoomTrack: Playable {
    
    public var isPlayable: Bool {
        return track != nil
    }
    
    public var explicit: Bool {
        return track!.explicit
    }
    
    public var releasedAt: Date? {
        return track?.releaseDate
    }
    
    public var duration: Int {
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
    
    public func play(deviceId: String?, positionMs: Int? = nil, offset: ContentOffset? = nil, baseUrl: URL? = nil, urlSession: URLSession? = nil) async throws -> PlayState {
        
        guard let track = track else {
            throw NetworkError.badRequest("Track is null")
        }
        
        return try await Self.playContent(track.uri, deviceId: deviceId, positionMs: positionMs, offset: offset, baseUrl: baseUrl, urlSession: urlSession)
    }
    
        
}

// MARK: - Track

extension Track: Playable {
    
    public var releasedAt: Date? {
        return releaseDate
    }
    
    public var duration: Int {
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

#if os(macOS)
extension UIColor {
    public static let label = UIColor.controlColor
    public static let secondaryLabel = UIColor.controlBackgroundColor
    public static let tertiaryLabel = UIColor.controlBackgroundColor
    public static let quaternaryLabel = UIColor.controlBackgroundColor
    public static let link = UIColor.controlBackgroundColor
    public static let placeholderText = UIColor.controlBackgroundColor
    
        // Adaptable separators
    public static let separator = UIColor.controlBackgroundColor
    public static let opaqueSeparator = UIColor.controlBackgroundColor
    
    public static let systemBackground = UIColor.controlBackgroundColor
    public static let secondarySystemBackground = UIColor.controlBackgroundColor
    public static let tertiarySystemBackground = UIColor.controlBackgroundColor
    
    
        // Adaptable grouped backgrounds
    public static let systemGroupedBackground = UIColor.controlBackgroundColor
    public static let secondarySystemGroupedBackground = UIColor.controlBackgroundColor
    public static let tertiarySystemGroupedBackground = UIColor.controlBackgroundColor
    
        // Adaptable system fills
    public static let systemFill = UIColor.controlBackgroundColor
    public static let secondarySystemFill = UIColor.controlBackgroundColor
    public static let tertiarySystemFill = UIColor.controlBackgroundColor
    public static let quaternarySystemFill = UIColor.controlBackgroundColor
}
#endif

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {
    
#if !os(watchOS) // watchOS doesn't support adaptable colors.
                 // Adaptable colors
    public static let systemRed = Color(UIColor.systemRed)
    public static let systemGreen = Color(UIColor.systemGreen)
    public static let systemBlue = Color(UIColor.systemBlue)
    public static let systemOrange = Color(UIColor.systemOrange)
    public static let systemYellow = Color(UIColor.systemYellow)
    public static let systemPink = Color(UIColor.systemPink)
    public static let systemPurple = Color(UIColor.systemPurple)
    public static let systemTeal = Color(UIColor.systemTeal)
    public static let systemIndigo = Color(UIColor.systemIndigo)
    
        // Adaptable grayscales
    public static let systemGray = Color(UIColor.systemGray)
#if os(iOS) // tvOS doesn't have the adaptable gray shades, just the primary color.
    public static let systemGray2 = Color(UIColor.systemGray2)
    public static let systemGray3 = Color(UIColor.systemGray3)
    public static let systemGray4 = Color(UIColor.systemGray4)
    public static let systemGray5 = Color(UIColor.systemGray5)
    public static let systemGray6 = Color(UIColor.systemGray6)
#endif //!tvOS
    
        // Adaptable text colors
    public static let label = Color(UIColor.label)
    public static let secondaryLabel = Color(UIColor.secondaryLabel)
    public static let tertiaryLabel = Color(UIColor.tertiaryLabel)
    public static let quaternaryLabel = Color(UIColor.quaternaryLabel)
    public static let link = Color(UIColor.link)
    public static let placeholderText = Color(UIColor.placeholderText)
    
        // Adaptable separators
    public static let separator = Color(UIColor.separator)
    public static let opaqueSeparator = Color(UIColor.opaqueSeparator)
    
#if !os(tvOS) // tvOS supports the above adaptable colors, but not these. 🤷‍♂️
              // Adaptable backgrounds
    public static let systemBackground = Color(UIColor.systemBackground)
    public static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    public static let tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)
    
    
        // Adaptable grouped backgrounds
    public static let systemGroupedBackground = Color(UIColor.systemGroupedBackground)
    public static let secondarySystemGroupedBackground = Color(UIColor.secondarySystemGroupedBackground)
    public static let tertiarySystemGroupedBackground = Color(UIColor.tertiarySystemGroupedBackground)
    
        // Adaptable system fills
    public static let systemFill = Color(UIColor.systemFill)
    public static let secondarySystemFill = Color(UIColor.secondarySystemFill)
    public static let tertiarySystemFill = Color(UIColor.tertiarySystemFill)
    public static let quaternarySystemFill = Color(UIColor.quaternarySystemFill)
#endif // !tvOS
#endif // !watchOS
    
        // "Fixed" colors
        // Some of these clash with existing Color names: compare Color.blue (0.22, 0.57, 0.97) in the light theme to
        // UIColor.blue (0.01, 0.19, 0.97) to see two very different shades of blue. For that matter the adaptable
        // UIColor.systemBlue in the light theme (0.25, 0.56, 0.97) isn't *quite* the same blue as Color.blue either.
    
        //So all of the UIColor "fixed" colors are here with "fixed" prepended to the color name.
    public static let fixedBlack = Color(UIColor.black)
    public static let fixedDarkGray = Color(UIColor.darkGray)
    public static let fixedLightGray = Color(UIColor.lightGray)
    public static let fixedWhite = Color(UIColor.white)
    public static let fixedGray = Color(UIColor.gray)
    public static let fixedRed = Color(UIColor.red)
    public static let fixedGreen = Color(UIColor.green)
    public static let fixedBlue = Color(UIColor.blue)
    public static let fixedCyan = Color(UIColor.cyan)
    public static let fixedYellow = Color(UIColor.yellow)
    public static let fixedMagenta = Color(UIColor.magenta)
    public static let fixedOrange = Color(UIColor.orange)
    public static let fixedPurple = Color(UIColor.purple)
    public static let fixedBrown = Color(UIColor.brown)
    public static let fixedClear = Color(UIColor.clear)
    
        // There are a few more predefined UIColors that could go here. groupTableViewBackground is formally deprecated
        // in favor of systemGroupedBackground so I didn't include it. lightText and darkText are not formally deprecated,
        // but there is a comment recommending replacing them with label and related colors so I didn't add them to this
        // list.
}
