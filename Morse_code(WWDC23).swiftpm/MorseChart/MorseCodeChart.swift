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
