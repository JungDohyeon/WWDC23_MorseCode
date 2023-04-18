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
            
            HStack(spacing: 20) {
                Spacer()
                
                Text(morseCode)
                    .font(.custom(.concertOne, size: 25))
                    .foregroundColor(.white)
                    .padding()
                
                Button(action: {
                    if !morseCode.isEmpty {
                        morseCode.removeLast()
                    }
                }) {
                    Image(systemName: "delete.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
                
                Button(action: {
                    morseCode = ""
                }) {
                    Text("Clear!")
                }
                
                Button(action: {
                    showModal.toggle()
                    isARSessionPausedSubmit = true
                }) {
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
                
                Spacer()
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


struct EyeblinkingMorse_Previews: PreviewProvider {
    static var previews: some View {
        EyeblinkingMorse()
    }
}

