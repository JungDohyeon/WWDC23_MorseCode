//
//  LearnMorse3.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/19.
//

import SwiftUI

struct LearnMorse3: View {
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
                .frame(height: isShow ? 200 : .infinity)
                .mask(
                    Text("About Morse Eye")
                        .font(Font.system(size: 50, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                
                if isShow {
                    VStack (spacing: 30) {
                        HStack {
                            Text("SOS")
                                .font(.custom(.muktaBold, size: 20))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .background(.red)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(.red.opacity(0.6), lineWidth: 5)
                                )
                                .cornerRadius(10)
                                .padding(.trailing, 10)
                        
                            Text("SOS is a distress signal derived from Morse code. \nYou can immediately send an emergency signal by pressing the corresponding button.")
                        }
                        
                        HStack {
                            Image(systemName: "lightbulb.led")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                                .foregroundColor(.white)
                                .padding(.trailing, 20)
                                .padding(.leading, 30)
                        
                            Text("If you click the corresponding icon, Morse code is displayed using the light of the device.")
                        }
                        
                        HStack {
                            Image(systemName: "waveform.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45)
                                .foregroundColor(.white)
                                .padding(.trailing, 15)
                                .padding(.leading, 50)
                            
                            Text("If you click the corresponding icon, Morse code is expressed as a specific mechanical sound.")
                        }
                        
                        HStack {
                            Image(systemName: "tablecells")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .padding(12)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 5)
                                )
                                .cornerRadius(10)
                                .padding(.trailing, 10)
                                .padding(.leading, 70)
                            
                            Text("This is a page where you can visually and audibly learn Morse code for each letter. (light, sound)")
                        }
                        
                        HStack {
                            Image(systemName: "keyboard.badge.eye")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                                .padding(12)
                                .background(.pink)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.pink, lineWidth: 5)
                                )
                                .cornerRadius(10)
                                .padding(.leading, 20)
                                .padding(.trailing, 10)
                            
                            Text("This function generates Morse code by detecting the user's eyes through the AR camera.")
                        }
                    }
                    .foregroundColor(Color("myGray"))
                    .multilineTextAlignment(.leading)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2).delay(2)) {
                            isNext = true
                        }
                    }
                }
                
                if isNext {
                    Spacer()
                        .frame(height: 60)
                    NavigationLink(destination: LearnMorse2()) {
                        NextBtn3()
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

struct LearnMorse3_Previews: PreviewProvider {
    static var previews: some View {
        LearnMorse3()
    }
}
