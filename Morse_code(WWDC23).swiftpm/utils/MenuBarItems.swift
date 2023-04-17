//
//  MenuBarItems.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/16.
//

import SwiftUI

struct leadingMenu: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .foregroundColor(.blue)
        }
    }
}


struct trailingMenu1: View {
    @State private var isShowingDetails = false
    
    var body: some View {
        HStack {
            NavigationLink(destination: ContentView()) {
                Image(systemName: "house")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundColor(.blue)
            }
            
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
