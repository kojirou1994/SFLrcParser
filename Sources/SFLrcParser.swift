import Foundation

struct SFLrcParser {
    let lyric: String
    
    init(rawLyric: String) {
        var lyric = rawLyric
        while let range = lyric.range(of: "\n") {
            lyric.removeSubrange(range)
        }
        self.lyric = lyric
    }
    
    func parse() -> [SFLyric] {
        let lines = lyric.components(separatedBy: "[").filter { $0.characters.count > 0 && $0.contains("]")}
        var lyrics = lines.map { line -> SFLyric in
            let comp = line.components(separatedBy: "]")
            return SFLyric(time: comp[0], text: comp.count > 1 ? comp[1] : "")
        }
        lyrics.sort{ $0 < $1 }
        return lyrics
    }
}

