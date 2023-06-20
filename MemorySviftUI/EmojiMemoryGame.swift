//
//  EmojiMemoryGame.swift
//  MemorySviftUI
//
//  Created by Elenka on 19.06.2023.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🦊", "🐻", "🐼", "🐷", "🦁", "🐸", "🐣", "🦆", "🦋", "🐞", "🐌", "🪰", "🐢", "🦂", "🦕"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    
}
