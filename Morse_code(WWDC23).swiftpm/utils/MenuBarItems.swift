//
//  MenuBarItems.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/16.
//

import SwiftUI

struct leadingMenu: View {
    var body: some View {
        NavigationLink(destination: ContentView()) {
            Image(systemName: "house.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .foregroundColor(.white)
                .padding(.leading, 10)
        }
    }
}


struct trailingMenu1: View {
    @State private var isShowingDetails = false
    
    var body: some View {
        HStack {
            Button {
                isShowingDetails.toggle()
            } label: {
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
            }
            .sheet(isPresented: $isShowingDetails) {
                SOSDetails()
            }
        }
    }
}
