//
//  SOSDetails.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/16.
//

import SwiftUI

struct SOSDetails: View {
    var body: some View {
        Text("S O S")
            .font(.system(size: 90).weight(.black))
            .foregroundColor(.red)
            .padding(.bottom, 50)
        
        HStack(spacing: 7){
            ForEach(0..<3) { _ in
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
            }
            ForEach(0..<3) { _ in
                Capsule()
                    .frame(width: 70, height: 40)
                    .foregroundColor(.gray)
            }
            ForEach(0..<3) { _ in
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
            }
        }
        
        HStack (spacing: 110) {
            Button {
                flashMorseCode(morseCode: "••• --- •••")
            } label: {
                Image(systemName: "lightbulb.led.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .foregroundColor(.blue)
            }
            
            Button {
                MorseCodePlayer().playCode(code: "••• --- •••")
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
    
        HStack (spacing: 70) {
            Text("Light Flash")
                .font(.system(size: 20).weight(.black))
                .foregroundColor(.black)
            Text("Sound Play")
                .font(.system(size: 20).weight(.black))
                .foregroundColor(.black)
        }
    }
}

struct SOSDetails_Previews: PreviewProvider {
    static var previews: some View {
        SOSDetails()
    }
}
