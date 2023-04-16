
import SwiftUI
import RealityKit
import ARKit
import Combine

struct eyeblinkingMorse : View {
    var body: some View {
        ARViewContainer()
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let eyeBlinkDetector = EyeBlinkDetector()
        arView.session.delegate = eyeBlinkDetector
        let config = ARFaceTrackingConfiguration()
        config.isLightEstimationEnabled = true
        arView.session.run(config)
        context.coordinator.eyeBlinkDetector = eyeBlinkDetector
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject {
        var eyeBlinkDetector: EyeBlinkDetector?
    }
}

class EyeBlinkDetector: NSObject, ARSessionDelegate {
    
    let eyeBlinkThreshold = 0.45
    var blinkPublisher = PassthroughSubject<Void, Never>()
    var leftEyeClosed = false
    var rightEyeClosed = false
    var closedStartTime: TimeInterval?
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        guard let faceAnchor = anchors.first(where: { $0 is ARFaceAnchor }) as? ARFaceAnchor else { return }
        
        let leftEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkLeft]?.doubleValue ?? 0
        let rightEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkRight]?.doubleValue ?? 0
        
        if leftEyeBlinkValue > eyeBlinkThreshold {
            leftEyeClosed = true
        }
        
        if rightEyeBlinkValue > eyeBlinkThreshold {
            rightEyeClosed = true
        }
        
        
        if leftEyeClosed && rightEyeClosed {
            if closedStartTime == nil {
                closedStartTime = CACurrentMediaTime()
            }
        }
        
        if leftEyeClosed && rightEyeClosed && leftEyeBlinkValue < 0.2 && rightEyeBlinkValue < 0.2 {
            if closedStartTime == nil {
                closedStartTime = CACurrentMediaTime()
            }
            
            if let closedStartTime = closedStartTime {
                let blinkTime = CACurrentMediaTime() - closedStartTime
                let _ = print(blinkTime)
                
                if blinkTime >= 0.1 {
                    leftEyeClosed = false
                    rightEyeClosed = false
                    self.closedStartTime = nil
                    blinkPublisher.send(())
                }
            }
        } else {
            closedStartTime = nil
        }
    }
}
