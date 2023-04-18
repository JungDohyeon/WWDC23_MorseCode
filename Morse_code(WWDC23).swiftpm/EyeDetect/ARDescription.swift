//
//  ARDescription.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/17.
//

import SwiftUI

struct ARDescription: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("How to Use")
                    .font(Font.custom("HelveticaNeue-Bold", size: 60))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                
                VStack {
                    Text("Instructions")
                        .font(Font.custom("HelveticaNeue-Bold", size: 30))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    HStack {
                        Image(systemName: "eye.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                        Text("Look at the front camera")
                            .font(Font.custom("HelveticaNeue", size: 20))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                    
                    HStack {
                        Image(systemName: "eye.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                        Text("Blink your eyes while staring at the screen")
                            .font(Font.custom("HelveticaNeue", size: 20))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                    .padding(.bottom, 50)
                }
                
                VStack {
                    Text("Input Rules")
                        .font(Font.custom("HelveticaNeue-Bold", size: 30))
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                    HStack {
                        Circle()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            .padding(.trailing, 10)
                        Text("Close your eyes and open them before 0.4 seconds.")
                            .font(Font.custom("HelveticaNeue", size: 20))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                    
                    HStack {
                        Capsule()
                            .frame(width: 80, height: 40)
                            .foregroundColor(.white)
                            .overlay(Capsule().stroke(Color.gray, lineWidth: 2))
                            .padding(.trailing, 10)
                        Text("Close your eyes and open them after 0.4 seconds.")
                            .font(Font.custom("HelveticaNeue", size: 20))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                }
                .padding()
            }
        }
    }
}


struct ARDescription_Previews: PreviewProvider {
    static var previews: some View {
        ARDescription()
    }
}
