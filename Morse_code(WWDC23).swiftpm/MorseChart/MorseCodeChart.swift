//
//  MorseCodeChart.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/15.
//

import SwiftUI

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
