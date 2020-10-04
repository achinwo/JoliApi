//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 19/09/2020.
//

import Foundation
import Combine

public struct OptionSetIterator<Element: OptionSet>: Sequence, IteratorProtocol where Element.RawValue == Int {
    private let value: Element
    
    public init(element: Element) {
        self.value = element
    }
    
    private lazy var remainingBits = value.rawValue
    private var bitMask = 1
    
    public mutating func next() -> Element? {
        while remainingBits != 0 {
            defer { bitMask = bitMask &* 2 }
            if remainingBits & bitMask != 0 {
                remainingBits = remainingBits & ~bitMask
                return Element(rawValue: bitMask)
            }
        }
        return nil
    }
}

extension OptionSet where Self.RawValue == Int {
    
    public func makeIterator() -> OptionSetIterator<Self> {
        return OptionSetIterator(element: self)
    }
}

public enum Search: String, CaseIterable, Identifiable {
    
    case sports
    case movies
    case songs
    //case culture
    case places
    //case history
    case playrooms
    
    public struct Category: OptionSet, CustomStringConvertible, Identifiable, Hashable, Comparable, Equatable {
        
        public static func < (lhs: Search.Category, rhs: Search.Category) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        public var description: String {
            return self.label
        }
        
        public var hashValue: Int {
            return rawValue
        }
        
        public let rawValue: Int
        
        public var label: String {
            return Self.rawValueLabelMap[self]?.label ?? "Category(\(rawValue))"
        }
        
        public var labelPlural: String {
            return Self.rawValueLabelMap[self]?.plural ?? "\(label)s"
        }
        
        public var emoji: String? {
            guard let char = Self.rawValueLabelMap[self]?.emoji else {
                return nil
            }
            
            return String(char)
        }
        
        public var id: Int {
            return rawValue
        }
        
        public init(rawValue: Int){
            self.rawValue = rawValue
        }
        
        public static var rawValueLabelMap: [Category: (label: String, plural: String?, emoji: Character?)] {
            
            return [
                Self.playrooms: ("Playroom", nil, "🎶"),
                Self.tracks: ("Track", nil, "🎵"),
                Self.albums: ("Album", nil, "💽"),
                Self.playlists: ("Playlist", nil, "💿"),
                Self.artists: ("Artist", nil, "👤"),
                Self.shows: ("Show", nil, "📻"),
                Self.episodes: ("Episode", nil, "🎙"),
                Self.all: (label: "All", nil, nil),
            ]
        }
        
        public static var allCases: [Self] = [.tracks, .albums, .artists, .playlists, .episodes, .playrooms, .shows]
        
        public static let playrooms = Category(rawValue: 1 << 0)
        public static let tracks = Category(rawValue: 1 << 2)
        public static let albums = Category(rawValue: 1 << 3)
        public static let playlists = Category(rawValue: 1 << 4)
        public static let artists = Category(rawValue: 1 << 5)
        public static let shows = Category(rawValue: 1 << 6)
        public static let episodes = Category(rawValue: 1 << 7)
        
        public static let all: Category = Category(rawValue: ([.tracks, .albums, .artists, .playlists, .episodes, .playrooms, .shows] as Category).rawValue)
    }
    
    public typealias Query = String
    
    public struct Result: Identifiable {
        
        public struct Offset: Hashable {
            let no: Int
            let of: Int
            
            init(_ no: Int, _ of: Int){
                self.no = no
                self.of = of
            }
            
            init(no: Int, of: Int){
                self.init(no, of)
            }
        }
        
        public var id: String {
            return "\(engine.name)[\(category.labelPlural)](\"\(queryText)\", offset: \(offset.no) of \(offset.of))"
        }
        
        public let offset: Offset
        
        public let queryText: Query
        public let engine: Search.Engine
        public let category: Category
        
        public init(_ id: (no: Int, of: Int), q: Query, category: Category, engine: Engine){
            self.init(Offset(id.no, id.of), q: q, category: category, engine: engine)
        }
        
        public init(_ offset: Offset, q: Query, category: Category, engine: Engine){
            queryText = q
            self.category = category
            self.engine = engine
            self.offset = offset
        }
        
    }
    
    public typealias ResultPublisher = AnyPublisher<[Result], Never>
    
    public struct Engine: Identifiable, Equatable, CustomStringConvertible {
        
        public var description: String {
            return "SearchEngine(\(name))"
        }
        
        public var id: String {
            return name
        }
        
        public let supportedCategories: Category
        public let name: String
        
        public init(_ name: String, categories: Category) {
            self.name = name
            self.supportedCategories = categories
        }
    }
    
    public var id: String {
        return self.rawValue
    }
    
}
