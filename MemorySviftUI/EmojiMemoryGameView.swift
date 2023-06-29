//
//  EmojiMemoryGameView.swift
//  MemorySviftUI
//
//  Created by Elenka on 18.06.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    private let columns = [
        GridItem(.adaptive(minimum: 76))
    ]
    
    var body: some View {
        AspectVGridView(item: game.cards, aspectRatio: 2/3) { card in
            cardView(for: card)

        }
        .foregroundColor(.orange)
        .padding(.horizontal)
    }

    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
    }

}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrowingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.strokeBorder(lineWidth: DrowingConstants.lineWidth)
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }

    private func font(in size: CGSize) -> Font {
        .system(size: min(size.width, size.height) * DrowingConstants.fontScale)
    }

    private struct DrowingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.75
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(game: EmojiMemoryGame())
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}


