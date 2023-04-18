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
            
            HStack(spacing: 5){
                ForEach(morseCode.description.map { String($0) }, id: \.self) { code in
                    switch code {
                    case "•":
                        Circle()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.pink)
                    case "-":
                        Capsule()
                            .frame(width: 60, height: 35)
                            .foregroundColor(.pink)
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
                    Image(systemName: "lightbulb.led")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .foregroundColor(.black)
                }
                
                // Sound
                Button {
                    MorseCodePlayer().playCode(code: morseCode.description)
                } label: {
                    Image(systemName: "waveform.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .foregroundColor(.black)
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
    }
}


struct MorseDetails_Previews: PreviewProvider {
    static var previews: some View {
        MorseDetails(morseCode: MorseCode(title: "Z", description: "- - • •", image: "capsule.fill"))
    }
}
