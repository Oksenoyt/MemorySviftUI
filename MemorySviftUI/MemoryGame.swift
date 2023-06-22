//
//  MemoryGame.swift
//  MemorySviftUI
//
//  Created by Elenka on 19.06.2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: [Card]
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id } ),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            print(indexOfTheOneAndOnlyFaceUpCard)
            if let potentionalMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                print(cards[chosenIndex])
                if cards[chosenIndex].content == cards[potentionalMatchIndex].content {
                    print("qwe")
                    cards[chosenIndex].isMatched = true
                    cards[potentionalMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                print("qwe2")
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
