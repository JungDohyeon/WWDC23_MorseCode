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
                        .font(Font.system(size: 55, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                
                if isShow {
                    VStack {
                        Text("The international rules for Morse code were established by the International Telecommunication Union (ITU), which is the United Nations agency responsible for regulating international communications.")
                            .font(.system(size: 30, weight: .light))
                            .padding(.bottom, 30)
                            .foregroundColor(Color("myGray"))
                        
                        
                            Text("International Rules for Morse Code")
                                .font(Font.system(size: 32, weight: .bold))
                                .padding(.top, 20)
                                .foregroundColor(.white)
                                .padding(.bottom, 8)
                        
                        
                        VStack (spacing: 7) {
                            Text("**1.** The duration of a dash is three times the duration of a dot.")
                            Text("**2.** The duration of the space between dots and dashes of the same letter is equal to one dot.")
                            Text("**3.** The duration of the space between letters is equal to three dots.")
                            Text("**4.** The duration of the space between words is equal to seven dots.")
                        }
                        .font(.system(size: 25, weight: .light))
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                    .foregroundColor(Color("myGray"))
                }
                
                if isNext {
                    Spacer()
                        .frame(height: 40)
                    NextBtn2()
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
