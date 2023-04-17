//
//  LearnMorse1.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/16.
//

import SwiftUI

struct LearnMorse1: View {
    
    @State private var isShow = false
    @State private var isNext = false
    
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
                .frame(width: isShow ? 600 : .infinity, height: isShow ? 200 : .infinity)
                .mask(
                    Text("About Morse Code")
                        .font(Font.system(size: 50, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                
                
                if isShow {
                    Text(" The term Morse code refers to one of two systems for representing alphabetic letters, numbers, and symbols, etc., as arrangements of dots, dashes, and spaces. \n\n Codes are transmitted as visual or audible signals, such as electrical pulses of varying length or flashing lights.")
                        .font(.custom(.muktaRegular, size: 27))
                        .foregroundColor(.black)
                        .padding(.top, 50)
                        .padding(.horizontal, 40)
                }
                
                if isNext {
                    NavigationLink(destination: LearnMorse2()) {
                        NextBtn()
                    }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1).delay(1)) {
                    isShow = true
                }
                withAnimation(.easeInOut(duration: 2).delay(2)) {
                    isNext = true
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

// Page Next Btn
struct NextBtn: View {
    var body: some View {
        HStack {
            Group {
                Spacer()
                Text("Tap to Next")
                    .font(.system(size: 25, design: .monospaced))
                Image(systemName: "chevron.right.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .padding(.trailing, 50)
            }
            .frame(height: 100)
        }
    }
}



struct LearnMorse1_Previews: PreviewProvider {
    static var previews: some View {
        LearnMorse1()
    }
}
