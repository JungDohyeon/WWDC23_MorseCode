//
//  MorseCodeFlash.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/17.
//

import SwiftUI
import AVFoundation

// Morse Code - Flash
func flashMorseCode(morseCode: String) {
    let device = AVCaptureDevice.default(for: .video)
    try? device?.lockForConfiguration()
    
    for character in morseCode {
        switch character {
        case "-":
            try? device?.setTorchModeOn(level: 1.0)
            Thread.sleep(forTimeInterval: 0.5)
            device?.torchMode = .off
            Thread.sleep(forTimeInterval: 0.2)
        case "•":
            try? device?.setTorchModeOn(level: 1.0)
            Thread.sleep(forTimeInterval: 0.2)
            device?.torchMode = .off
            Thread.sleep(forTimeInterval: 0.2)
        case " ":
            Thread.sleep(forTimeInterval: 0.55)
        default:
            break
        }
    }
    device?.unlockForConfiguration()
}
