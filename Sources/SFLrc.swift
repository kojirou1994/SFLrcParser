//
//  SFLrc.swift
//  SFLrcParser
//
//  Created by 王宇 on 2016/8/29.
//
//

import Foundation

public struct SFLrc {
    
    public var lyrics: [SFLyric]
    
    public func currentLyric(byTime mileSecond: Int) -> String {
        guard let laterLyric = lyrics.index(where: { $0.time > mileSecond }), laterLyric > 0 else {
            return ""
        }
        return lyrics[laterLyric - 1].text
    }
}
