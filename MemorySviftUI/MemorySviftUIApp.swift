//
//  MemorySviftUIApp.swift
//  MemorySviftUI
//
//  Created by Elenka on 18.06.2023.
//

import SwiftUI

@main
struct MemorySviftUIApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
