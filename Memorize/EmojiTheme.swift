//
//  MemoryGameCardTheme.swift
//  Memorize
//
//  Created by Antonio J Rossi on 5/6/21.
//

import Foundation

struct EmojiTheme<Content> {
    let name: String
    let color: ColorTheme
    let numberOfPairOfCards: Int
    let emojis: Array<Content>
    
    init(name: String, color: ColorTheme, emojis: Array<Content>) {
        self.init(name: name, color: color, numberOfPairOfCards: Value.max, emojis: emojis)
    }
    
    init(name: String, color: ColorTheme, numberOfPairOfCards: Value, emojis: Array<Content>) {
        self.name = name
        self.color = color
        switch numberOfPairOfCards {
        case .max:
            self.numberOfPairOfCards = emojis.count
        case .min:
            self.numberOfPairOfCards = 4
        case .randon:
            self.numberOfPairOfCards = (4...emojis.count).randomElement()!
        case .fixed(let n):
            self.numberOfPairOfCards = min(emojis.count, n)
        }
        self.emojis = emojis.shuffled()
    }
    
    enum ColorTheme {
        case solid(Color)
        case gradient(startColor: Color, endColor: Color)
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
    
    enum Value {
        case min
        case max
        case fixed(Int)
        case randon
    }
}
