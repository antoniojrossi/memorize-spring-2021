//
//  ContentView.swift
//  Memorize
//
//  Created by Antonio J Rossi on 30/5/21.
//

import SwiftUI

struct ContentView: View {    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            header
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, theme: viewModel.currentTheme)
                            .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    var header: some View {
        ZStack{
            Text("\(viewModel.score)")
                .font(.largeTitle)
                .foregroundColor(viewModel.currentTheme.startColor)
            HStack {
                Text(viewModel.currentTheme.name)
                    .font(.title)
                Spacer()
                Button(action: {
                    viewModel.newGame()
                }, label: {
                    Text("New game")
                })
            }
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    let theme: EmojiMemoryGame.CardTheme

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
                shape.fill(LinearGradient(gradient: Gradient(colors: [theme.startColor, theme.endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
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
