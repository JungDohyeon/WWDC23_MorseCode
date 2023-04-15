//
//  MorseCodeChart.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/15.
//

import SwiftUI

struct MorseCard: View {
    let morseCode: MorseCode
    
    @State private var isShowingDetails = false
    
    
    var body: some View {
        Button {
            isShowingDetails.toggle()
        } label: {
            VStack {
                Image(systemName: morseCode.image)
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                
                Text(morseCode.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(morseCode.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [.black, .purple]), startPoint: .top, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .sheet(isPresented: $isShowingDetails) {
                MorseDetails(morseCode: morseCode)
            }
        }
    }
}


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
        MorseCode(title: "Z", description: "--••", image: "z.circle.fill")
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),  GridItem(.flexible())], spacing: 15) {
                ForEach(morseCodes, id: \.self) { morseCode in
                    MorseCard(morseCode: morseCode)
                }
            }
            .padding()
        }
    }
}

struct MorseCode: Hashable {
    let title: String
    let description: String
    let image: String
}

struct MorseCodeChart: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Morse Code Chart")
                    .font(.system(size: 40).weight(.black))
                    .padding()
                MorseGrid()
            }
        }
    }
}

struct MorseCodeChart_Previews: PreviewProvider {
    static var previews: some View {
        MorseCodeChart()
    }
}
