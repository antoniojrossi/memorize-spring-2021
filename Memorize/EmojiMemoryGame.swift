//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Antonio J Rossi on 5/6/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static func createMemoryGame(with theme: EmojiTheme<String>) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    static var themes = ThemeManager<EmojiTheme<String>>(
        themes: [
            EmojiTheme<String>(name: "Animals", color: .gradient(startColor: .brown, endColor: .black), emojis: [
                "🐶","🐱","🐭","🐹","🐰","🐻","🦊","🐼","🐨","🦁","🐻‍❄️","🐵"
            ]),
            EmojiTheme<String>(name: "Sports", color: .gradient(startColor: .black, endColor: .blue), numberOfPairOfCards: .min, emojis: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉"]),
            EmojiTheme<String>(name: "Weather", color: .gradient(startColor: .purple, endColor: .blue), emojis: ["☀️", "🌤", "⛅️", "🌥", "☁️", "🌦", "🌧", "⛈", "🌩", "🌨", "❄️", "🌈"]),
            EmojiTheme<String>(name: "Fruits", color: .gradient(startColor: .green, endColor: .yellow), numberOfPairOfCards: .fixed(6), emojis: ["🥝","🥥","🍍","🥭","🍑","🍒","🍓","🍇","🍉","🍌","🍋","🍊","🍐","🍎"]),
            EmojiTheme<String>(name: "Vehicles", color: .solid(.red), numberOfPairOfCards: .max, emojis: ["🚗","🚕","🚙","🚌","🚎","🚓","🚑","🚒","🚐","🚚","🚛"]),
            EmojiTheme<String>(name: "Faces", color: .gradient(startColor: .yellow, endColor: .orange), emojis: ["😃","😁","😅","😂","🤣","☺️"]),
            EmojiTheme<String>(name: "Halloween", color: .solid(.orange), numberOfPairOfCards: .randon, emojis: ["😈","🎃","👻","💀","🦇","🕷", "🍬", "🍭"])
        ]
    )
    
    @Published private var model: MemoryGame<String> = createMemoryGame(with: themes.currentTheme)

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var currentTheme: CardTheme {
        return CardTheme(EmojiMemoryGame.themes.currentTheme)
    }
    
    var score: Int {
        return model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        EmojiMemoryGame.themes.randomizeCurrentTheme()
        model = EmojiMemoryGame.createMemoryGame(with: EmojiMemoryGame.themes.currentTheme)
    }
    
    struct CardTheme {
        static func adapt(_ color: EmojiTheme<String>.Color) -> Color {
            switch color {
            case .blue:
                return Color.blue
            case .brown:
                return Color.init(UIColor.brown)
            case .green:
                return Color.green
            case .red:
                return Color.red
            case .orange:
                return Color.orange
            case .purple:
                return Color.purple
            case .black:
                return Color.black
            case .yellow:
                return Color.yellow
            }
        }
        
        let name: String
        let startColor: Color
        let endColor: Color
        
        init(_ emojiTheme: EmojiTheme<String>) {
            self.name = emojiTheme.name
            switch emojiTheme.color {
            case .solid(let color):
                self.startColor = CardTheme.adapt(color)
                self.endColor = CardTheme.adapt(color)
            case .gradient(let startColor, let endColor):
                self.startColor = CardTheme.adapt(startColor)
                self.endColor = CardTheme.adapt(endColor)
            }
        }
    }
}
