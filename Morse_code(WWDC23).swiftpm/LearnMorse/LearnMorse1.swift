//
//  LearnMorse1.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/16.
//

import SwiftUI

struct LearnMorse1: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.15), .indigo.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{

                Spacer()
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
                Spacer()
                
                HStack {
                    Text("Morse code is a method used in telecommunication to encode text characters as standardized sequences of two different signal durations, called dots and dashes, or dits and dahs.[3][4] Morse code is named after Samuel Morse, one of the inventors of the telegraph.")
                        .padding(.bottom, 30)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:  Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left") // 이미지를 추가합니다.
                }
            },
            
            trailing: trailingMenu()
        )
    }
}

struct trailingMenu: View {
    @State private var isShowingDetails = false
    
    var body: some View {
        HStack {
            NavigationLink(destination: ContentView()) {
                Image(systemName: "house")
            }
            
            Button {
                isShowingDetails.toggle()
            } label: {
                Image(systemName: "sos.circle")
            }
            .sheet(isPresented: $isShowingDetails) {
                SOSDetails()
            }

        }
    }
}


struct LearnMorse1_Previews: PreviewProvider {
    static var previews: some View {
        LearnMorse1()
    }
}
