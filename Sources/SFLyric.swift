//
//  SFLyric.swift
//  SFLrcParser
//
//  Created by 王宇 on 2016/8/27.
//
//

import Foundation

public enum SFLyricError: Error {
    case timeSyntaxError
}

public struct SFLyric {
    public var time: Int
    public var text: String
    
    public init(time: String, text: String) throws {
        let time = time.substring(from: time.index(time.startIndex, offsetBy: 1))
        guard let minute = Int(time.substring(to: time.index(time.startIndex, offsetBy: 2))),
            let second = Int(time[time.index(time.startIndex, offsetBy: 3)..<time.index(time.startIndex, offsetBy: 5)]),
            let mileSecond = Int(time[time.index(time.startIndex, offsetBy: 6)..<time.index(time.startIndex, offsetBy: 8)]) else {
            throw SFLyricError.timeSyntaxError
        }
        self.time = (minute * 60 + second) * 1000 + mileSecond * 10
        self.text = text
    }
}

extension SFLyric: Comparable {
    
    public static func ==(lhs: SFLyric, rhs: SFLyric) -> Bool {
        return lhs.time == rhs.time && lhs.text == rhs.text
    }
    
    public static func <(lhs: SFLyric, rhs: SFLyric) -> Bool {
        return lhs.time < rhs.time
    }
    
    public static func <=(lhs: SFLyric, rhs: SFLyric) -> Bool {
        return lhs.time <= rhs.time
    }
    
    public static func >=(lhs: SFLyric, rhs: SFLyric) -> Bool {
        return lhs.time >= rhs.time
    }

    public static func >(lhs: SFLyric, rhs: SFLyric) -> Bool {
        return lhs.time > rhs.time
    }
}
