//
//  LearnMorse2.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/16.
//

import SwiftUI

struct LearnMorse2: View {
    @State private var isShow = false
    @State private var isNext = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack{
                LinearGradient(
                    colors: [.white, .pink],
                    startPoint: .topLeading,
                    endPoint: .bottom
                )
                .frame(height: isShow ? 100 : .infinity)
                .mask(
                    Text("Morse Code Rules")
                        .font(Font.system(size: 50, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                
                if isShow {
                    VStack {
                        Text("The international rules for Morse code were established by the International Telecommunication Union (ITU), which is the United Nations agency responsible for regulating international communications.")
                            .font(.custom(.muktaRegular, size: 26))
                            .padding(.bottom, 30)
                            .foregroundColor(Color("myGray"))
                        
                        LinearGradient(
                            colors: [.white, .pink],
                            startPoint: .topLeading,
                            endPoint: .bottom
                        )
                        .frame(height: 50)
                        .mask(
                            Text("International Rules for Morse Code")
                                .font(Font.system(size: 30, weight: .bold))
                                .padding(.top, 20)
                                .foregroundColor(.pink)
                        )
                        
                        Group {
                            Text("1. The duration of a dash is three times the duration of a dot.")
                            Text("2. The duration of the space between elements (dots and dashes) of the same letter is equal to one dot.")
                            Text("3. The duration of the space between letters is equal to three dots.")
                            Text("4. The duration of the space between words is equal to seven dots.")
                        }
                        .font(.custom(.muktaRegular, size: 20))
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                    .foregroundColor(Color("myGray"))
                }
                
                if isNext {
                    Spacer()
                        .frame(height: 60)
                    NavigationLink(destination: LearnMorse3()) {
                        NextBtn2()
                    }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1).delay(1)) {
                    isShow = true
                }
                withAnimation(.easeInOut(duration: 3).delay(2)) {
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

struct LearnMorse2_Previews: PreviewProvider {
    static var previews: some View {
        LearnMorse2()
    }
}
