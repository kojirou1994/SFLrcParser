//
//  SFLyric.swift
//  SFLrcParser
//
//  Created by 王宇 on 2016/8/27.
//
//

import Foundation

struct SFLyric {
    var time: Int
    var text: String
    
    init(time: String, text: String) {
        let minute = Int(time.substring(to: time.index(time.startIndex, offsetBy: 2))) ?? 0
        let second = Int(time[time.index(time.startIndex, offsetBy: 3)..<time.index(time.startIndex, offsetBy: 5)]) ?? 0
        let mileSecond = Int(time[time.index(time.startIndex, offsetBy: 6)..<time.index(time.startIndex, offsetBy: 8)]) ?? 0
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
