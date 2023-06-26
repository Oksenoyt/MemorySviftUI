//
//  EmojiMemoryGame.swift
//  MemorySviftUI
//
//  Created by Elenka on 19.06.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🦊", "🐻", "🐼", "🐷", "🦁", "🐸", "🐣", "🦆", "🦋", "🐞", "🐌", "🪰", "🐢", "🦂", "🦕"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: [Card] {
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    
}
