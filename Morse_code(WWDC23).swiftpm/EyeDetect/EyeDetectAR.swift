//
//  EyeDetectAR.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/17.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var morseCode: String
    @Binding var isPausedSubmit: Bool
    @Binding var isPausedHelp: Bool
    
    @Binding var blinkBinding: Timer?
    @Binding var blankBinding: Timer?
    @Binding var timeblink: Double
    @Binding var timeblank: Double
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARFaceTrackingConfiguration()
        config.isWorldTrackingEnabled = false
        config.isLightEstimationEnabled = true
        arView.session.run(config, options: [])
        arView.session.delegate = context.coordinator
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if isPausedSubmit || isPausedHelp {
               uiView.session.pause()
           } else {
               uiView.session.run(ARFaceTrackingConfiguration(), options: [])
           }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        let eyeCloseThreshHold: Float = 0.4
        var parent: ARViewContainer?
        var leftEyeBlinkValue: Float = 0
        var rightEyeBlinkValue: Float = 0
        var blinkStartedAt: Date?
        var blinkEndedAt: Date?
        var latestBlink: Date?
        var morseCode: String = ""
        
        var blinkTime: Double = 0.00
        var blankTime: Double = 0.00
    
        init(parent: ARViewContainer) {
            self.parent = parent
        }
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            guard !parent!.isPausedSubmit || !parent!.isPausedHelp,
                  let faceAnchor = anchors.first(where: { $0 is ARFaceAnchor }) as? ARFaceAnchor
            else {
                return
            }
            
            leftEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkLeft]?.floatValue ?? 0.0
            rightEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkRight]?.floatValue ?? 0.0
            
            if leftEyeBlinkValue > eyeCloseThreshHold && rightEyeBlinkValue > eyeCloseThreshHold  {
                if blinkStartedAt == nil {
                    blinkStartedAt = Date()
                    if blinkEndedAt != nil {
                        
                        parent?.blinkBinding = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [self] _ in
                            parent?.timeblink += 0.01
                        })
                        parent?.blankBinding?.invalidate()
                        parent?.timeblank = 0.00
                        
                        if blinkStartedAt!.timeIntervalSince(blinkEndedAt!) >= 1.3 {
                            parent?.$morseCode.wrappedValue += "  "
                        }
                        else if blinkStartedAt!.timeIntervalSince(blinkEndedAt!) >= 0.7 {
                            parent?.$morseCode.wrappedValue += " "
                        }
                    }
                }
            } else {
                if let startedAt = blinkStartedAt {
                    blinkEndedAt = Date()
                    let blinkDuration = blinkEndedAt!.timeIntervalSince(startedAt)
                    let morseSymbol = blinkDuration > 0.4 ? "-" : "•"
                    parent?.$morseCode.wrappedValue += morseSymbol
                    
                    parent?.blinkBinding?.invalidate()
                    parent?.timeblink = 0.00
                    
                    parent?.blankBinding = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [self] _ in
                        parent?.timeblank += 0.01
                    })
                }
                blinkStartedAt = nil
            }
        }
    }
}
