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
                Button(action: {
                    morseCode = ""
                }) {
                    Text("Clear!")
                        .font(.custom(.muktaRegular, size: 23))
                        .foregroundColor(.pink)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.pink.opacity(0.8), lineWidth: 1)
                        )
                }
                .padding(.leading, 20)
                
                
                Spacer()
                
                Text(morseCode)
                    .font(.custom(.concertOne, size: 25))
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    if !morseCode.isEmpty {
                        morseCode.removeLast()
                    }
                }) {
                    Image(systemName: "delete.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 23)
                        .foregroundColor(.pink)
                }
            
                
                
                Button(action: {
                    showModal.toggle()
                    isARSessionPausedSubmit = true
                }) {
                    Text("Decrypt!")
                        .foregroundColor(Color("myGray"))
                        .font(.custom(.concertOne, size: 25))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.pink)
                        .cornerRadius(10)
                }
                .padding(.trailing, 20)
                .sheet(isPresented: $showModal) {
                    DecodeMorse(userInput: $morseCode)
                        .onDisappear {
                            isARSessionPausedSubmit = false
                        }
                }
            }
            .background(.black)
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
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.pink)
                            .frame(width: 45)
                    }
                    .sheet(isPresented: $showHelp) {
                        ARDescription()
                            .onDisappear {
                                isARSessionPausedHelp = false
                            }
                    }
                    trailingMenu1()
                }
        )
    }
}


struct EyeblinkingMorse_Previews: PreviewProvider {
    static var previews: some View {
        EyeblinkingMorse()
    }
}

