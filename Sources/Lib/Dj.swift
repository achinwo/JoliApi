//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 25/12/2019.
//

import Foundation

extension Double {
    
    static var goldenRatio: Double {
        return 1.61803398875
    }
}

public enum DiscjockeyPosition: Int, CaseIterable, CustomStringConvertible {
    /// 🤦🏾‍♂️ foolishness
    case personal = 0 // high vote recharge - 234.881s recharge
    case assistantHead = 1  // 2.38m recharge
    case executive = 2  // 1.5m recharge
    case leadCreativeDirector = 3 // 57.344s recharge
    case executiveHeadOfSales = 4 // 35.84s recharge
    case distributionManager = 5 // 22.4s recharge
    case starboy = 6 // 16 second recharge
    case directorOfPhotography = 7 // image capture and upload - 10 second recharge
    case soundEngineer = 8 // mix creator
    
    public var rechargeTime: TimeInterval {
        return Double(self.rawValue) / Double.goldenRatio
    }
    
    public var description: String {
        switch self {
        case .soundEngineer:
            return "\(self.emoji) Sound Engineer"
        case .directorOfPhotography:
            return "\(self.emoji) DOP"
        case .starboy:
            return "\(self.emoji) Starboy"
        case .assistantHead:
            return "\(self.emoji) Assistant Head"
        case .personal:
            return "\(self.emoji) Personal"
        case .executive:
            return "\(self.emoji) Executive"
        case .executiveHeadOfSales:
            return "\(self.emoji) Executive Head of Sales"
        case .leadCreativeDirector:
            return "\(self.emoji) Lead Creative Director"
        case .distributionManager:
            return "\(self.emoji) Distribution Manager"
        }
    }
    
    public var emoji: String {
        switch self {
            case .soundEngineer:
                return "🔊"
            case .directorOfPhotography:
                return "🎥"
            case .starboy:
                return "💫"
            case .assistantHead:
                return "👩🏾‍🍳"
            case .personal:
                return "💁🏾‍♀️"
            case .executive:
                return "😎"
            case .executiveHeadOfSales:
                return "👩🏾‍💼"
            case .leadCreativeDirector:
                return "🤸🏾‍♂️"
            case .distributionManager:
                return "🚗"
        }
    }
}

public protocol Discjockey {
    var ranking: DiscjockeyPosition { get }
//    optional func promoted()
//    optional mutating func promote()
}

public struct Dj: Discjockey {
    public var ranking: DiscjockeyPosition
    var averageVotesPerTrack: Int?
}
