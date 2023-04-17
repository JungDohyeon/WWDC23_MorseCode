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
            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.15), .indigo.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                LinearGradient(
                    colors: [.red, .blue, .green, .yellow],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .mask(
                    Text("How to Use ?")
                        .font(Font.system(size: 50, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                .frame(height: 200)
                
                Group {
                    Text("look at the front camera")
                    Text("Then blink your eyes while staring at the screen")
                        .padding(.bottom, 50)
                }
                .font(.custom(.muktaRegular, size: 27))
                
                Text("Input Rules")
                Group {
                    Text("BlinkTime")
                }
            }
            
        }
    }
}

struct ARDescription_Previews: PreviewProvider {
    static var previews: some View {
        ARDescription()
    }
}
