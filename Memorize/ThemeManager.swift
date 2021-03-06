//
//  Theme.swift
//  Memorize
//
//  Created by Antonio J Rossi on 5/6/21.
//

import Foundation

struct ThemeManager<Theme> {
    let themes: Array<Theme>
    var currentTheme: Theme
    
    init(themes: Array<Theme>) {
        self.themes = themes.shuffled()
        self.currentTheme = themes.randomElement()!
    }
    
    mutating func randomizeCurrentTheme() {
        self.currentTheme = themes.randomElement()!
    }
}
