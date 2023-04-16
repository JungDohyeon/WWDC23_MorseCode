import SwiftUI
import RealityKit
import ARKit

struct EyeblinkingMorse: View {
    @State private var morseCode: String = ""
    
    var body: some View {
        VStack {
            ARViewContainer(morseCode: $morseCode)
                .edgesIgnoringSafeArea(.all)
            HStack {
                Text(morseCode)
                    .font(.system(size: 32))
                    .padding()
                
                
                // ARview까지 업데이트가 안됨.
                Button(action: {
                    if !morseCode.isEmpty {
                        morseCode.removeLast()
                    }
                }) {
                    Image(systemName: "delete.left")
                        .font(.system(size: 24))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: leadingMenu()
        )
    }
}
