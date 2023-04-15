//
//  GameMorse.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/15.
//

import SwiftUI


struct GameMorse: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .black.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("Select Games")
                    .font(.system(size: 60).weight(.black))
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                HStack (spacing: 20){
                    
                    Button(action: {}) {
                        Text("SOUND TEST")
                            .foregroundColor(.white)
                    }
                    .frame(width: 280, height: 500)
                    .padding()
                    .background(Color.blue.opacity(0.4))
                    .cornerRadius(10)
                    
                    Button(action: {}) {
                        Image(systemName: "Blinking Test")
                            .foregroundColor(.white)
                    }
                    .frame(width: 280, height: 500)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    Button(action: {}) {
                        Image(systemName: "")
                            .foregroundColor(.white)
                    }
                    .frame(width: 280, height: 500)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
                    
                }
                .padding(.horizontal, 10)
            }
        }
        
    }
}

struct GameMorse_Previews: PreviewProvider {
    static var previews: some View {
        GameMorse()
    }
}
