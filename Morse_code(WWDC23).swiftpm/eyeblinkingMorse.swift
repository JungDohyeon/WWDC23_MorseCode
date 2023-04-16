import SwiftUI
import RealityKit
import ARKit

struct eyeblinkingMorse : View {
    var body: some View {
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
           let arView = ARView(frame: .zero)
           let config = ARFaceTrackingConfiguration()
           config.isWorldTrackingEnabled = false // 카메라 전환을 위해 false로 설정
           config.isLightEstimationEnabled = true
           arView.session.run(config, options: [])
           arView.session.delegate = context.coordinator // ARViewDelegate 지정
           return arView
       }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, ARSessionDelegate { // ARSessionDelegate 채택
        var leftEyeBlinkValue: Float = 0
        var rightEyeBlinkValue: Float = 0
        var blinkStartedAt: Date?
        var blinkEndedAt: Date?
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            guard let faceAnchor = anchors.first(where: { $0 is ARFaceAnchor }) as? ARFaceAnchor else { return }
            
            // 눈 깜빡임 감지
            leftEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkLeft]?.floatValue ?? 0.0
            rightEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkRight]?.floatValue ?? 0.0
            
            if leftEyeBlinkValue > 0.4 || rightEyeBlinkValue > 0.4 {
                if blinkStartedAt == nil {
                    blinkStartedAt = Date()
                }
            } else {
                if blinkStartedAt != nil {
                    blinkEndedAt = Date()
                    if let startedAt = blinkStartedAt, let endedAt = blinkEndedAt {
                        let blinkDuration = endedAt.timeIntervalSince(startedAt)
                        let _ = print("Blink duration: \(blinkDuration) seconds")
                        // 눈 감았다 뜬 시간 측정 기능 추가
                        let closedDuration = endedAt.timeIntervalSince(startedAt)
                        let _ = print("Eyes closed for \(closedDuration) seconds")
                    }
                    blinkStartedAt = nil
                    blinkEndedAt = nil
                }
            }
        }
    }
}
