import SwiftUI
import ARKit
import Combine

class EyeBlinkDetector: NSObject, ARSCNViewDelegate {
    
    var blinkPublisher = PassthroughSubject<Void, Never>()
    var leftEyeClosed: Bool = false
    var rightEyeClosed: Bool = false
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard anchor is ARFaceAnchor else { return nil }
        let contentNode = SCNNode()
        return contentNode
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        
        // 양쪽 눈 미는 정도를 가져옴
        let leftEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkLeft]?.doubleValue ?? 0
        let rightEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkRight]?.doubleValue ?? 0
        
        // 눈이 완전히 감겼는지 체크
        if leftEyeBlinkValue > 0.4 {
            leftEyeClosed = true
            let _ = print("left eye blinking")
        }
        if rightEyeBlinkValue > 0.4 {
            rightEyeClosed = true
            let _ = print("right eye blinking")
        }
        
        // 눈이 완전히 감겨있는 상태에서 눈을 떴을 때, blinkPublisher에서 Void값을 emit
        if leftEyeClosed && rightEyeClosed && leftEyeBlinkValue < 0.2 && rightEyeBlinkValue < 0.2 {
            leftEyeClosed = false
            rightEyeClosed = false
            blinkPublisher.send(())
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView(frame: .zero)
        let eyeBlinkDetector = EyeBlinkDetector()
        arView.delegate = eyeBlinkDetector
        let configuration = ARFaceTrackingConfiguration()
        arView.session.run(configuration)
        context.coordinator.eyeBlinkDetector = eyeBlinkDetector
        return arView
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject {
        var eyeBlinkDetector: EyeBlinkDetector?
    }
}

struct eyeblinkingMorse: View {
    var body: some View {
        VStack {
            ARViewContainer()
            Text("Blink your eyes to emit the event")
        }
    }
}
