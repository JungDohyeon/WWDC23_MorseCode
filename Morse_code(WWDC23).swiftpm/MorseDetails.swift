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
    let device = AVCaptureDevice.default(for: .video)
    
    var body: some View {
        
        VStack {
            Text(morseCode.title)
                .font(.system(size: 80).weight(.black))
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
            .padding(.bottom, 30)
            
            // Sound & Flash
            HStack (spacing: 100) {
                Button {
                    flashMorseCode(morseCode: morseCode)
                } label: {
                    Image(systemName: "lightbulb.led.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    
    func flashMorseCode(morseCode: MorseCode) {
           let device = AVCaptureDevice.default(for: .video)
           try? device?.lockForConfiguration()
           
           for character in morseCode.description {
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
}

struct MorseDetails_Previews: PreviewProvider {
    static var previews: some View {
        MorseDetails(morseCode: MorseCode(title: "Z", description: "- - • •", image: "capsule.fill"))
    }
}
