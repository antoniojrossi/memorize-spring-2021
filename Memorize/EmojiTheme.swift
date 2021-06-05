//
//  MemoryGameCardTheme.swift
//  Memorize
//
//  Created by Antonio J Rossi on 5/6/21.
//

import Foundation

struct EmojiTheme<Content> {
    let name: String
    let color: Color
    let numberOfPairOfCards: Int
    let emojis: Array<Content>
    
    init(name: String, color: Color, emojis: Array<Content>) {
        self.init(name: name, color: color, numberOfPairOfCards: emojis.count, emojis: emojis)
    }
    
    init(name: String, color: Color, numberOfPairOfCards: Int, emojis: Array<Content>) {
        self.name = name
        self.color = color
        self.numberOfPairOfCards = min(numberOfPairOfCards, emojis.count)
        self.emojis = emojis.shuffled()
    }
    
    enum Color {
        case orange
        case red
        case green
        case brown
        case blue
        case purple
        case black
        case yellow
    }
}
