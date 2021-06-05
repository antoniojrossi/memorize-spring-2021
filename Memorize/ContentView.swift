//
//  ContentView.swift
//  Memorize
//
//  Created by Antonio J Rossi on 30/5/21.
//

import SwiftUI

struct ContentView: View {
//    @State var emojis = ["🐶","🐱","🐭","🐹","🐰","🐻","🦊","🐼","🐨","🐯","🦁","🐮","🐷","🐻‍❄️","🐵"].shuffled()
//    @State var emojiCount = Int.random(in: 4...15)
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
//    var theme1: some View {
//        VStack {
//            Button {
//                emojis = ["🐶","🐱","🐭","🐹","🐰","🐻","🦊","🐼","🐨","🐯","🦁","🐮","🐷","🐻‍❄️","🐵"].shuffled()
//                emojiCount = Int.random(in: 4...emojis.count)
//            } label: {
//                VStack {
//                    Image(systemName: "tortoise")
//                        .font(.largeTitle)
//                    Text("Animals")
//                        .font(.subheadline)
//                }
//            }
//        }
//        .padding(.horizontal)
//    }
//
//    var theme2: some View {
//        Button {
//            emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🏓","⛳️","🥊","🥋","🏸","🏏","⛸","🥌","🥍","🏑","🏒"].shuffled()
//            emojiCount = Int.random(in: 4...emojis.count)
//        } label: {
//            VStack {
//                Image(systemName: "sportscourt")
//                    .font(.largeTitle)
//                Text("Sports")
//                    .font(.subheadline)
//            }
//        }
//        .padding(.horizontal)
//    }
//
//    var theme3: some View {
//        Button {
//            emojis = ["☀️", "🌤", "⛅️", "🌥", "☁️", "🌦", "🌧", "⛈", "🌩", "🌨", "❄️", "🌈"].shuffled()
//            emojiCount = Int.random(in: 4...emojis.count)
//        } label: {
//            VStack {
//                Image(systemName: "cloud.sun")
//                    .font(.largeTitle)
//                Text("Weather")
//                    .font(.subheadline)
//            }
//        }
//        .padding(.horizontal)
//    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
