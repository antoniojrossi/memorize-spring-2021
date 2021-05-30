//
//  ContentView.swift
//  Memorize
//
//  Created by Antonio J Rossi on 30/5/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🐶","🐱","🐭","🐹","🐰","🐻","🦊","🐼","🐨","🐯","🦁","🐮","🐷","🐻‍❄️","🐵"].shuffled()
    @State var emojiCount = Int.random(in: 4...15)
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .padding(.vertical)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack(alignment: .lastTextBaseline) {
                theme1
                theme2
                theme3
            }
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var theme1: some View {
        VStack {
            Button {
                emojis = ["🐶","🐱","🐭","🐹","🐰","🐻","🦊","🐼","🐨","🐯","🦁","🐮","🐷","🐻‍❄️","🐵"].shuffled()
                emojiCount = Int.random(in: 4...emojis.count)
            } label: {
                VStack {
                    Image(systemName: "tortoise")
                        .font(.largeTitle)
                    Text("Animals")
                        .font(.subheadline)
                }
            }
        }
        .padding(.horizontal)
    }
    
    var theme2: some View {
        Button {
            emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🏓","⛳️","🥊","🥋","🏸","🏏","⛸","🥌","🥍","🏑","🏒"].shuffled()
            emojiCount = Int.random(in: 4...emojis.count)
        } label: {
            VStack {
                Image(systemName: "sportscourt")
                    .font(.largeTitle)
                Text("Sports")
                    .font(.subheadline)
            }
        }
        .padding(.horizontal)
    }
    
    var theme3: some View {
        Button {
            emojis = ["☀️", "🌤", "⛅️", "🌥", "☁️", "🌦", "🌧", "⛈", "🌩", "🌨", "❄️", "🌈"].shuffled()
            emojiCount = Int.random(in: 4...emojis.count)
        } label: {
            VStack {
                Image(systemName: "cloud.sun")
                    .font(.largeTitle)
                Text("Weather")
                    .font(.subheadline)
            }
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewDevice("iPad Air (4th generation)")
        ContentView()
            .preferredColorScheme(.dark)
    }
}
