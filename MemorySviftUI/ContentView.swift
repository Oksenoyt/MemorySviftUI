//
//  ContentView.swift
//  MemorySviftUI
//
//  Created by Elenka on 18.06.2023.
//

import SwiftUI

struct ContentView: View {
    private let columns = [
        GridItem(.adaptive(minimum: 50))
    ]
    let emojis = ["🦊", "🐻", "🐼", "🐷", "🦁", "🐸", "🐣", "🦆", "🦋", "🐞", "🐌", "🪰", "🐢", "🦂", "🦕"]
    
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                    }
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 2 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        HStack {
            Button {
                if emojiCount < emojis.count {
                    emojiCount += 1
                }
            } label: {
                Image(systemName: "plus.circle")
            }
        }
    }
}

struct CardView: View {
    var content: String
    
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.stroke(lineWidth: 3)
                //                Circle().foregroundColor(.white)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


