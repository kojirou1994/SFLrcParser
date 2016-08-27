//
//  SFLrcParser.swift
//  SFLrcParser
//
//  Created by 王宇 on 2016/8/27.
//
//

import Foundation

struct SFLrcParser {
    let lyric: String
    
    init(rawLyric: String) {
//        var lyric = rawLyric
//        while let range = lyric.range(of: "\n") {
//            lyric.removeSubrange(range)
//        }
        self.lyric = rawLyric
    }
    
    func parse() -> [SFLyric] {
        let lines = lyric.components(separatedBy: "\n").filter { $0.characters.count > 0 && $0.hasPrefix("[") && $0.contains("]")}
        var lyrics = [SFLyric]()
        lines.forEach({ line in
            let comp = line.components(separatedBy: "]")
            let time = comp[0]
            let text = comp.count > 1 ? comp[1] : ""
            if time.characters.count == 9 && time[time.index(time.startIndex, offsetBy: 3)] == ":" && time[time.index(time.startIndex, offsetBy: 6)] == "." {
                do {
                    let lyric = try SFLyric(time: time, text: text)
                    lyrics.append(lyric)
                } catch {
                    return
                }
            }
        })
        lyrics.sort{ $0 < $1 }
        return lyrics
    }
}

