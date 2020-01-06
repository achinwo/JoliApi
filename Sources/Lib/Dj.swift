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
            return "🔊 Sound Engineer"
        case .directorOfPhotography:
            return "🎥 DOP"
        case .starboy:
            return "💫 Starboy"
        case .assistantHead:
            return "👩🏾‍🍳 Assistant Head"
        case .personal:
            return "💁🏾‍♀️ Personal"
        case .executive:
            return "😎 Executive"
        case .executiveHeadOfSales:
            return "👩🏾‍💼 Executive Head of Sales"
        case .leadCreativeDirector:
            return "🤸🏾‍♂️ Lead Creative Director"
        case .distributionManager:
            return "🚗 Distribution Manager"
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
