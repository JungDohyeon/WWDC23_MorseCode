import SwiftUI
import RealityKit
import ARKit

struct EyeblinkingMorse: View {
    @State private var morseCode: String = ""
    @State private var isARSessionPaused = false
    @State private var showModal = false
    
    var body: some View {
        VStack {
            ARViewContainer(morseCode: $morseCode, isPaused: $isARSessionPaused)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Spacer()
                
                Text(morseCode)
                    .font(.system(size: 32))
                    .padding()
                
                Button {
                    if !morseCode.isEmpty {
                        morseCode.removeLast()
                    }
                } label: {
                    Image(systemName: "delete.left")
                        .font(.system(size: 24))
                }
                
                Spacer()
                
                Button {
                    showModal.toggle()
                    isARSessionPaused = true
                } label: {
                    Text("Decode!")
                }
                .padding(.trailing, 20)
                .sheet(isPresented: $showModal) {
                    DecodeMorse(userInput: $morseCode)
                        .onDisappear {
                            isARSessionPaused = false
                        }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: leadingMenu(),
            trailing: trailingMenu2()
        )
    }
}
