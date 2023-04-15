//
//  LearnMorse.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/15.
//

import SwiftUI

struct LearnMorse: View {
    @State private var isNextScreenShown = false
       
       var body: some View {
           ZStack {
               LinearGradient(gradient: Gradient(colors: [.green.opacity(0.15), .indigo.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                   .ignoresSafeArea()
               
               if isNextScreenShown {
                   GameMorse()
               } else {
                   Text("Tap anywhere to go to the next screen")
                       .foregroundColor(.white)
                       .font(.title)
               }
           } .onTapGesture {
               withAnimation {
                   isNextScreenShown = true
               }
           }
       }
}

struct LearnMorse_Previews: PreviewProvider {
    static var previews: some View {
        LearnMorse()
    }
}
