//
//  LearnMorse1.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/16.
//

import SwiftUI

struct LearnMorse1: View {
    
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
                .frame(width: isShow ? 600 : .infinity, height: isShow ? 200 : .infinity)
                .mask(
                    Text("About Morse Code")
                        .font(Font.system(size: 50, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                
                
                if isShow {
                    Text(" The term Morse code refers to one of two systems for representing alphabetic letters, numbers, and symbols, etc., as arrangements of dots, dashes, and spaces. \n\n Codes are transmitted as visual or audible signals, such as electrical pulses of varying length or flashing lights.")
                        .font(.custom(.muktaRegular, size: 27))
                        .foregroundColor(Color("myGray"))
                        .padding(.top, 50)
                        .padding(.horizontal, 40)
                }
                
                if isNext {
                    NextBtn1()
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1).delay(1)) {
                    isShow = true
                }
                withAnimation(.easeInOut(duration: 2).delay(2)) {
                    isNext = true
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

// Page Next Btn
struct NextBtn1: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack {
            Group {
                Spacer()
                
                NavigationLink(destination: LearnMorse2()) {
                    Text("Next")
                        .font(.system(size: 20, design: .monospaced))
                        .foregroundColor(Color("myDarkGray"))
                        .padding(.trailing, 5)
                    Image(systemName: "chevron.right.2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .padding(.trailing, 50)
                        .foregroundColor(Color("myDarkGray"))
                }
            }
            .frame(height: 100)
        }
    }
}


// Page Next Btn
struct NextBtn2: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack {
            Group {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left.2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .padding(.leading, 50)
                        .foregroundColor(Color("myDarkGray"))
                        .padding(.trailing, 5)
                    Text("Before")
                        .font(.system(size: 20, design: .monospaced))
                        .foregroundColor(Color("myDarkGray"))
                }
                
                Spacer()
                
                NavigationLink(destination: LearnMorse2()) {
                    Text("Next")
                        .font(.system(size: 20, design: .monospaced))
                        .foregroundColor(Color("myDarkGray"))
                        .padding(.trailing, 5)
                    Image(systemName: "chevron.right.2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .padding(.trailing, 50)
                        .foregroundColor(Color("myDarkGray"))
                }
            }
            .frame(height: 100)
        }
    }
}



struct LearnMorse1_Previews: PreviewProvider {
    static var previews: some View {
        LearnMorse1()
    }
}
