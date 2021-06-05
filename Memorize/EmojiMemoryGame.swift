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
    
    static let themes = ThemeManager<EmojiTheme<String>>(
        themes: [
            EmojiTheme<String>(name: "Animals", color: .brown, emojis: [
                "🐶","🐱","🐭","🐹","🐰","🐻","🦊","🐼","🐨","🦁","🐻‍❄️","🐵"
            ]),
            EmojiTheme<String>(name: "Sports", color: .red, numberOfPairOfCards: 4, emojis: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉"]),
            EmojiTheme<String>(name: "Weather", color: .blue, emojis: ["☀️", "🌤", "⛅️", "🌥", "☁️", "🌦", "🌧", "⛈", "🌩", "🌨", "❄️", "🌈"]),
            EmojiTheme<String>(name: "Fruits", color: .purple, numberOfPairOfCards: 6, emojis: ["🥝","🥥","🍍","🥭","🍑","🍒","🍓","🍇","🍉","🍌","🍋","🍊","🍐","🍎"]),
            EmojiTheme<String>(name: "Vehicles", color: .red, emojis: ["🚗","🚕","🚙","🚌","🚎","🚓","🚑","🚒","🚐","🚚","🚛"]),
            EmojiTheme<String>(name: "Faces", color: .yellow, emojis: ["😃","😁","😅","😂","🤣","☺️"]),
            EmojiTheme<String>(name: "Halloween", color: .orange, emojis: ["😈","🎃","👻","💀","🦇","🕷", "🍬"])
        ]
    )
    
    @Published private var model: MemoryGame<String> = createMemoryGame(with: themes.currentTheme)

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var currentTheme: Theme {
        return Theme(EmojiMemoryGame.themes.currentTheme)
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    struct Theme {
        let name: String
        let color: Color
        
        init(_ emojiTheme: EmojiTheme<String>) {
            self.name = emojiTheme.name
            switch emojiTheme.color {
            case .blue:
                self.color = Color.blue
            case .brown:
                self.color = Color.init(UIColor.brown)
            case .green:
                self.color = Color.green
            case .red:
                self.color = Color.red
            case .orange:
                self.color = Color.orange
            case .purple:
                self.color = Color.purple
            case .black:
                self.color = Color.black
            case .yellow:
                self.color = Color.yellow
            }
        }
    }
}
