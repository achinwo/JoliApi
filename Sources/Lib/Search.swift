//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 19/09/2020.
//

import Foundation
import Combine


public enum Search: String, CaseIterable, Identifiable {
    
    case sports
    case movies
    case songs
    //case culture
    case places
    //case history
    case playrooms
    
    public struct Category: OptionSet, CustomStringConvertible {
        
        public var description: String {
            return self.label
        }
        
        public let rawValue: Int
        public let label: String
        public let labelPlural: String
        
        public init(rawValue: Int){
            self.rawValue = rawValue
            self.label = "Category(\(rawValue))"
            self.labelPlural = self.label
        }
        
        public init(_ label: String, rawValue: Int){
            self.rawValue = rawValue
            self.label = label
            self.labelPlural = "\(self.label)s"
        }
        
        public init(_ label: String, plural: String, rawValue: Int){
            self.rawValue = rawValue
            self.label = label
            self.labelPlural = plural
        }
        
        public static let track = Category("Track", rawValue: 1 << 0)
        public static let album = Category("Album", rawValue: 1 << 1)
        public static let show = Category("Show", rawValue: 1 << 2)
        public static let artist = Category("Artist", rawValue: 1 << 3)
        public static let playlist = Category("Playlist", rawValue: 1 << 4)
        public static let episode = Category("Episode", rawValue: 1 << 5)
        
        public static let playroom = Category("Playroom", rawValue: 1 << 6)
        
        public static let all: Category = [.track, .album, .show, .artist, .playlist, .episode, .playroom]
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
            return "\(engine.name)(\"\(queryText)\", offset: \(offset.no) of \(offset.of))"
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
