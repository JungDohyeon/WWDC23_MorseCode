//
//  Animate.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/15.
//

import SwiftUI

struct Animate: View {
    @State private var fillAmount1: CGFloat = 0.0
    @State private var fillAmount2: CGFloat = 0.0
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: geometry.size.width, height: 20)
                        .foregroundColor(.gray)
                    
                    Capsule()
                        .frame(width: fillAmount1 * geometry.size.width, height: 20)
                        .foregroundColor(.blue)
                        .animation(.easeInOut(duration: 1.0))
                    
                    Capsule()
                        .frame(width: fillAmount2 * geometry.size.width, height: 20)
                        .foregroundColor(.green)
                        .animation(.easeInOut(duration: 1.0))
                }
            }
            
            Button("Fill Capsules") {
                withAnimation {
                    self.fillAmount1 = 1.0
                    self.fillAmount2 = 1.0
                }
            }
        }
    }
}

struct Animate_Previews: PreviewProvider {
    static var previews: some View {
        Animate()
    }
}
