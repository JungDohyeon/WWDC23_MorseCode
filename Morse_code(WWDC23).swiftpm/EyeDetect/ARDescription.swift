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
            Color.gray.opacity(0.4)
            VStack {
                LinearGradient(
                    colors: [.white, .pink],
                    startPoint: .topLeading,
                    endPoint: .bottom
                )
                .mask(
                    Text("How to Use")
                        .font(Font.system(size: 50, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                .frame(height: 150)
                
                VStack {
                    Text("Instructions")
                        .font(Font.custom("HelveticaNeue-Bold", size: 25))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.bottom, 15)
                    
                    HStack {
                        Text("Look at the front camera")
                            .font(.custom(.muktaRegular, size: 20))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                    
                    HStack {
                        Text("Blink your eyes while staring at the screen")
                            .font(.custom(.muktaRegular, size: 20))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                    .padding(.bottom, 50)
                }
                
                VStack {
                    Text("Input Rules")
                        .font(Font.custom("HelveticaNeue-Bold", size: 25))
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                    HStack {
                        Circle()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.white)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            .padding(.trailing, 10)
                        HStack {
                            Text("Close your eyes and open them")
                                .font(.custom(.muktaRegular, size: 20))
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                            Text("before 0.4 seconds.")
                                .font(.custom(.muktaBold, size: 20))
                                .foregroundColor(.red)
                                .padding(.leading, 2)
                        }
                       
                    }
                    
                    HStack {
                        Capsule()
                            .frame(width: 50, height: 25)
                            .foregroundColor(.white)
                            .overlay(Capsule().stroke(Color.gray, lineWidth: 2))
                            .padding(.trailing, 10)
                        HStack {
                            Text("Close your eyes and open them")
                                .font(.custom(.muktaRegular, size: 20))
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                            Text("after 0.4 seconds.")
                                .font(.custom(.muktaBold, size: 20))
                                .foregroundColor(.red)
                                .padding(.leading, 2)
                        }
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
