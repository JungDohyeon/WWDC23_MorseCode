//
//  MorseCard.swift
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
                    .foregroundColor(.pink)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background(.gray.opacity(0.4))
            .cornerRadius(20)
            .sheet(isPresented: $isShowingDetails) {
                MorseDetails(morseCode: morseCode)
            }
        }
    }
}
