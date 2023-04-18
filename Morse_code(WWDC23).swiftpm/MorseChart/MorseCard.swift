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
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 101/255, green: 121/255, blue: 155/255), Color(red: 94/255, green: 27/255, blue: 99/255)]), startPoint: .top, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .sheet(isPresented: $isShowingDetails) {
                MorseDetails(morseCode: morseCode)
            }
        }
    }
}
