//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Antonio J Rossi on 30/5/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
