//
//  EmojiMemoryGame.swift
//  MemorySviftUI
//
//  Created by Elenka on 19.06.2023.
//

import SwiftUI

class EmojiMemoryGameЖ ObservableObject {
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
    
    //MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    
}
