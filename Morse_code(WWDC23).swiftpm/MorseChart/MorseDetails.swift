//
//  MorseDetails.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/15.
//

import SwiftUI
import AVFoundation

struct MorseDetails: View {
    let morseCode: MorseCode
    
    
    var body: some View {
        VStack {
            Text(morseCode.title)
                .font(.system(size: 90).weight(.black))
                .foregroundColor(.black)
                .padding(.bottom, 50)
            
            HStack(spacing: 7){
                ForEach(morseCode.description.map { String($0) }, id: \.self) { code in
                    switch code {
                    case "•":
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                    case "-":
                        Capsule()
                            .frame(width: 80, height: 50)
                            .foregroundColor(.gray)
                        
                    case " ":
                        Text(" ")
                    default:
                        EmptyView()
                    }
                }
            }
            
            // Flash & Sound
            HStack (spacing: 110) {
                // Flash
                Button {
                    flashMorseCode(morseCode: morseCode.description)
                } label: {
                    Image(systemName: "lightbulb.led.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .foregroundColor(.blue)
                }
                
                // Sound
                Button {
                    MorseCodePlayer().playCode(code: morseCode.description)
                } label: {
                    Image(systemName: "waveform.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .foregroundColor(.blue)
                }
            }
            .padding(.top, 100)
            .padding(.bottom, 30)
            
            // Icon Description
            HStack (spacing: 70) {
                Text("Light Flash")
                    .font(.system(size: 20).weight(.black))
                    .foregroundColor(.black)
                Text("Sound Play")
                    .font(.system(size: 20).weight(.black))
                    .foregroundColor(.black)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background( LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.2), .indigo.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea())
    }
}



// Morse Code - Flash
func flashMorseCode(morseCode: String) {
    let device = AVCaptureDevice.default(for: .video)
    try? device?.lockForConfiguration()
    
    for character in morseCode {
        switch character {
        case "-":
            try? device?.setTorchModeOn(level: 1.0)
            Thread.sleep(forTimeInterval: 0.7)
            device?.torchMode = .off
            Thread.sleep(forTimeInterval: 0.2)
        case "•":
            try? device?.setTorchModeOn(level: 1.0)
            Thread.sleep(forTimeInterval: 0.3)
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


struct MorseDetails_Previews: PreviewProvider {
    static var previews: some View {
        MorseDetails(morseCode: MorseCode(title: "Z", description: "- - • •", image: "capsule.fill"))
    }
}
