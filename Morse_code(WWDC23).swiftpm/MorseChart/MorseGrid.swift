//
//  MorseGrid.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/15.
//

import SwiftUI

struct MorseGrid: View {
    let morseCodes = [
        MorseCode(title: "A", description: "•-", image: "a.circle.fill"),
        MorseCode(title: "B", description: "-•••", image: "b.circle.fill"),
        MorseCode(title: "C", description: "-•-•", image: "c.circle.fill"),
        MorseCode(title: "D", description: "-••", image: "d.circle.fill"),
        MorseCode(title: "E", description: "•", image: "e.circle.fill"),
        MorseCode(title: "F", description: "••-•", image: "f.circle.fill"),
        MorseCode(title: "G", description: "--•", image: "g.circle.fill"),
        MorseCode(title: "H", description: "••••", image: "h.circle.fill"),
        MorseCode(title: "I", description: "••", image: "i.circle.fill"),
        MorseCode(title: "J", description: "•---", image: "j.circle.fill"),
        MorseCode(title: "K", description: "-•-", image: "k.circle.fill"),
        MorseCode(title: "L", description: "•-••", image: "l.circle.fill"),
        MorseCode(title: "M", description: "--", image: "m.circle.fill"),
        MorseCode(title: "N", description: "-•", image: "n.circle.fill"),
        MorseCode(title: "O", description: "---", image: "o.circle.fill"),
        MorseCode(title: "P", description: "•--•", image: "p.circle.fill"),
        MorseCode(title: "Q", description: "--•-", image: "q.circle.fill"),
        MorseCode(title: "R", description: "•-•", image: "r.circle.fill"),
        MorseCode(title: "S", description: "•••", image: "s.circle.fill"),
        MorseCode(title: "T", description: "-", image: "t.circle.fill"),
        MorseCode(title: "U", description: "••-", image: "u.circle.fill"),
        MorseCode(title: "V", description: "•••-", image: "v.circle.fill"),
        MorseCode(title: "W", description: "•--", image: "w.circle.fill"),
        MorseCode(title: "X", description: "-••-", image: "x.circle.fill"),
        MorseCode(title: "Y", description: "-•--", image: "y.circle.fill"),
        MorseCode(title: "Z", description: "--••", image: "z.circle.fill"),
        MorseCode(title: "1", description: "•----", image: "1.circle.fill"),
        MorseCode(title: "2", description: "••---", image: "2.circle.fill"),
        MorseCode(title: "3", description: "•••--", image: "3.circle.fill"),
        MorseCode(title: "4", description: "••••-", image: "4.circle.fill"),
        MorseCode(title: "5", description: "•••••", image: "5.circle.fill"),
        MorseCode(title: "6", description: "-••••", image: "6.circle.fill"),
        MorseCode(title: "7", description: "--•••", image: "7.circle.fill"),
        MorseCode(title: "8", description: "---••", image: "8.circle.fill"),
        MorseCode(title: "9", description: "----•", image: "9.circle.fill"),
        MorseCode(title: "0", description: "-----", image: "0.circle.fill")
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.15), .indigo.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView {
                Text("Morse Code Chart")
                    .font(.system(size: 40).weight(.black))
                    .foregroundColor(.indigo)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),  GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(morseCodes, id: \.self) { morseCode in
                        MorseCard(morseCode: morseCode)
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: leadingMenu()
        )
    }
}

struct MorseGrid_Previews: PreviewProvider {
    static var previews: some View {
        MorseGrid()
    }
}
