//
//  SOSDetails.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/16.
//

import SwiftUI

struct SOSDetails: View {
    @State var isFlashButtonDisabled = false
    @State var isSoundButtonDisabled = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("S O S")
                    .font(.system(size: 90).weight(.black))
                    .foregroundColor(.black)
                    .padding(.bottom, 50)
                
                HStack(spacing: 10){
                    ForEach(0..<3) { _ in
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.red)
                    }
                   
                    Text(" ")
                    ForEach(0..<3) { _ in
                        Capsule()
                            .frame(width: 70, height: 40)
                            .foregroundColor(.red)
                    }
                    Text(" ")
                    ForEach(0..<3) { _ in
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.red)
                    }
                }
                
                HStack (spacing: 110) {
                    Button {
                        flashMorseCode(morseCode: "••• --- •••")
                        isSoundButtonDisabled = true
                    } label: {
                        Image(systemName: "lightbulb.led")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                            .foregroundColor(.black)
                    }
                    .disabled(isFlashButtonDisabled)
                    
                    Button {
                        MorseCodePlayer().playCode(code: "••• --- •••")
                        isFlashButtonDisabled = true
                    } label: {
                        Image(systemName: "waveform.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .foregroundColor(.black)
                    }
                    .disabled(isSoundButtonDisabled)
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
    }
}

struct SOSDetails_Previews: PreviewProvider {
    static var previews: some View {
        SOSDetails()
    }
}
