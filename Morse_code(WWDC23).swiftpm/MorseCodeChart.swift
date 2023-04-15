//
//  MorseCodeChart.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/15.
//

import SwiftUI

struct MorseCodeChart: View {
    let morseCode: [String: String] = [
            "A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".", "F": "..-.", "G": "--.", "H": "....", "I": "..",
            "J": ".---", "K": "-.-", "L": ".-..", "M": "--", "N": "-.", "O": "---", "P": ".--.", "Q": "--.-", "R": ".-.",
            "S": "...", "T": "-", "U": "..-", "V": "...-", "W": ".--", "X": "-..-", "Y": "-.--", "Z": "--.."
        ]
        
        var body: some View {
            VStack {
                Text("Morse Code Table")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Array(morseCode.keys), id: \.self) { key in
                            VStack {
                                Text(key)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .padding(.bottom, 5)
                                Text(morseCode[key]!)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                            .padding(.horizontal, 5)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
}

struct MorseCodeChart_Previews: PreviewProvider {
    static var previews: some View {
        MorseCodeChart()
    }
}
