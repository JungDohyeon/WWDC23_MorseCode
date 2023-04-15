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
