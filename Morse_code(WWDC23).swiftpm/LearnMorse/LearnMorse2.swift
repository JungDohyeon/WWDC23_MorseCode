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
                .frame(width: isShow ? 600 : .infinity, height: isShow ? 200 : .infinity)
                .mask(
                    Text("Morse Code Rules")
                        .font(Font.system(size: 50, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                
                if isNext {
                    NavigationLink(destination: LearnMorse2()) {
                        NextBtn2()
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

struct LearnMorse2_Previews: PreviewProvider {
    static var previews: some View {
        LearnMorse2()
    }
}
