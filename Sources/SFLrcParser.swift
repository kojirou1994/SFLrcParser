//
//  SFLrcParser.swift
//  SFLrcParser
//
//  Created by 王宇 on 2016/8/27.
//
//

import Foundation

public struct SFLrcParser {
    let lyric: String
    
    public init(rawLyric: String) {
        self.lyric = rawLyric
    }
    
    public func parse() -> SFLrc {
        let lines = lyric.components(separatedBy: "\n").filter { $0.characters.count > 0 && $0.hasPrefix("[") && $0.contains("]")}
        var lyrics = [SFLyric]()
        lines.forEach({ line in
            let separateIndex = line.range(of: "]")!.lowerBound
            let tag = line.substring(to: separateIndex)
            let text = line.substring(from: line.index(separateIndex, offsetBy: 1))
            if tag.characters.count == 9 || tag.characters.count == 10 && tag[tag.index(tag.startIndex, offsetBy: 3)] == ":" && tag[tag.index(tag.startIndex, offsetBy: 6)] == "." {
                do {
                    let lyric = try SFLyric(time: tag, text: text)
                    lyrics.append(lyric)
                } catch {
                    return
                }
            } else {
                // Lrc tag info handling
            }
        })
        lyrics.sort{ $0 < $1 }
        return SFLrc(lyrics: lyrics)
    }
}

