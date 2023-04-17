import SwiftUI
import RealityKit
import ARKit

struct EyeblinkingMorse: View {
    @State private var morseCode: String = ""
    @State private var isARSessionPausedSubmit = false
    @State private var showModal = false
    
    @State private var isARSessionPausedHelp = false
    @State private var showHelp = false
    
    var body: some View {
        VStack {
            ARViewContainer(morseCode: $morseCode, isPausedSubmit: $isARSessionPausedSubmit, isPausedHelp: $isARSessionPausedHelp)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Spacer()
                
                Text(morseCode)
                    .font(.custom(.concertOne, size: 25))
                    .foregroundColor(.white)
                    .padding()
                
                
                Button {
                    if !morseCode.isEmpty {
                        morseCode.removeLast()
                    }
                } label: {
                    Image(systemName: "delete.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
                
                Spacer()
                
                Button {
                    showModal.toggle()
                    isARSessionPausedSubmit = true
                } label: {
                    Image(systemName: "lock.open.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                }
                .padding(.trailing, 20)
                .sheet(isPresented: $showModal) {
                    DecodeMorse(userInput: $morseCode)
                        .onDisappear {
                            isARSessionPausedSubmit = false
                        }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(.black)
        .navigationBarItems(
            leading: leadingMenu(),
            trailing:
                HStack {
                    Button {
                        showHelp.toggle()
                        isARSessionPausedHelp = true
                    } label: {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45)
                    }
                    .sheet(isPresented: $showHelp) {
                        ARDescription()
                            .onDisappear {
                                isARSessionPausedHelp = false
                            }
                    }
                    trailingMenu2()
                }
        )
    }
}
