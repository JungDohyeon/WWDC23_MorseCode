//
//  MainCardView.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/18.
//

import SwiftUI

struct ShadowCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 0, y: 2)
            VStack {
                Text("Hello, World!")
                    .font(.title)
                    .padding()
                Text("This is a card view with a simple shadow")
                    .font(.subheadline)
                    .padding()
            }
        }
        .padding()
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowCardView()
    }
}
