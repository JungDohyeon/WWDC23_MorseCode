//
//  LearnMorse1.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/16.
//

import SwiftUI

struct LearnMorse1: View {
   
    @State private var isShow = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.15), .indigo.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{
                LinearGradient(
                    colors: [.red, .blue, .green, .yellow],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .mask(
                    Text("About Morse Code")
                        .font(Font.system(size: 46, weight: .bold))
                        .multilineTextAlignment(.center)
                )
            
                
                if isShow {
                    Spacer()
                        .frame(height: isShow ? 100 : 0)
                    
                    HStack {
                        Text("Morse code is a method used in telecommunication to encode text characters as standardized sequences of two different signal durations, called dots and dashes, or dits and dahs.[3][4] Morse code is named after Samuel Morse, one of the inventors of the telegraph.")
                            .padding(.bottom, 40)
                            .padding(.horizontal, 10)
                    }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1).delay(1)) {
                    isShow = true
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: leadingMenu(),
            trailing: trailingMenu1()
        )
    }
}


struct LearnMorse1_Previews: PreviewProvider {
    static var previews: some View {
        LearnMorse1()
    }
}
