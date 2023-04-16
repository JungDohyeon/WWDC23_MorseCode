import SwiftUI
import RealityKit
import ARKit

struct EyeblinkingMorse: View {
    @State private var morseCode: String = ""
    
    var body: some View {
        VStack {
            ARViewContainer(morseCode: $morseCode)
                .edgesIgnoringSafeArea(.all)
            Text(morseCode)
                .font(.system(size: 32))
                .padding()
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var morseCode: String
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARFaceTrackingConfiguration()
        config.isWorldTrackingEnabled = false
        config.isLightEstimationEnabled = true
        arView.session.run(config, options: [])
        arView.session.delegate = context.coordinator
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        var parent: ARViewContainer?
        var leftEyeBlinkValue: Float = 0
        var rightEyeBlinkValue: Float = 0
        var blinkStartedAt: Date?
        var blinkEndedAt: Date?
        var morseCode: String = ""
        
        init(parent: ARViewContainer) {
            self.parent = parent
        }
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            guard let faceAnchor = anchors.first(where: { $0 is ARFaceAnchor }) as? ARFaceAnchor else { return }
            
            leftEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkLeft]?.floatValue ?? 0.0
            rightEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkRight]?.floatValue ?? 0.0
            
            if leftEyeBlinkValue > 0.4 || rightEyeBlinkValue > 0.4 {
                if blinkStartedAt == nil {
                    blinkStartedAt = Date()
                }
            } else {
                if let startedAt = blinkStartedAt {
                    blinkEndedAt = Date()
                    let blinkDuration = blinkEndedAt!.timeIntervalSince(startedAt)
                    let morseSymbol = blinkDuration > 0.4 ? "-" : "•"
                    morseCode += morseSymbol
                    parent?.morseCode = morseCode
                }
                blinkStartedAt = nil
                blinkEndedAt = nil
            }
        }
    }
}
