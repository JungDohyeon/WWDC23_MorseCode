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
            Image(systemName: "house")
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .foregroundColor(.green)
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
                Image(systemName: "sos.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45)
            }
            .sheet(isPresented: $isShowingDetails) {
                SOSDetails()
            }
        }
    }
}

struct trailingMenu2: View {
    @State private var isShowingDetails = false
    
    var body: some View {
        Button {
            isShowingDetails.toggle()
        } label: {
            Image(systemName: "sos.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 45)
        }
        .sheet(isPresented: $isShowingDetails) {
            SOSDetails()
        }
    }
}
