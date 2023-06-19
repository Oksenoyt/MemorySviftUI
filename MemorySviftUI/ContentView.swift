//
//  ContentView.swift
//  MemorySviftUI
//
//  Created by Elenka on 18.06.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🦊", "🐻", "🐼", "🐷", "🦁", "🐸", "🐣", "🦆", "🦋", "🐞", "🐌", "🪰", "🐢", "🦂", "🦕", "🦊", "🐻", "🐼", "🐷", "🦁", "🐸", "🐣", "🦆", "🦋", "🐞", "🐌", "🪰", "🐢", "🦂", "🦕"]
    
    var body: some View {
        ScrollView {
            Grid {
                ForEach(0..<emojis.count) { item in
                    CardView(content: emojis[item])
                }
            }
            .padding(.horizontal)
        .foregroundColor(.orange)
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


