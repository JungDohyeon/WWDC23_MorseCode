//
//  DecodeMorse.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/17.
//

import SwiftUI

struct DecodeMorse: View {
    @Binding var userInput: String
    @State private var validation = false
    var userDecode: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.1).ignoresSafeArea()
            VStack{
                LinearGradient(
                    colors: [.red, .green, .indigo, .black],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .mask(
                    Text("After Decoding")
                        .font(Font.system(size: 50, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                .frame(height: 150)
                
                HStack {
                    Image(systemName: "lock.fill")
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .padding(.leading, 30)
                        
                    Spacer()
                    
                    Text(userInput)
                        .font(.custom(.concertOne, size: 25))
                    
                    Spacer()
                }
                .padding(.bottom, 15)
                
                HStack {
                    Image(systemName: "lock.open")
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .padding(.leading, 30)
                    
                    Spacer()
                    
                    Text(decodeMorseCode(morseCode: userInput))
                        .font(.custom(.muktaRegular, size: 25))
                    
                    Spacer()
                    
                }
                
                
                if decodeMorseCode(morseCode: userInput) != "Input has UNDEFINED CHARACTER!" {
                    // Flash & Sound
                    HStack (spacing: 110) {
                        // Flash
                        Button {
                            flashMorseCode(morseCode: userInput)
                        } label: {
                            Image(systemName: "lightbulb.led.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .foregroundColor(.blue)
                        }
                        
                        // Sound
                        Button {
                            MorseCodePlayer().playCode(code: userInput)
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
                } else {
                    Button {
                        dismiss()
                    } label: {
                        Text("Retry")
                    }
                    .padding(.top, 30)
                }
            }
        }
    }
}


let morseCodeMapping: [String: String] = [
    "•-": "a",
    "-•••": "b",
    "-•-•": "c",
    "-••": "d",
    "•": "e",
    "••-•": "f",
    "--•": "g",
    "••••": "h",
    "••": "i",
    "•---": "j",
    "-•-": "k",
    "•-••": "l",
    "--": "m",
    "-•": "n",
    "---": "o",
    "•--•": "p",
    "--•-": "q",
    "•-•": "r",
    "•••": "s",
    "-": "t",
    "••-": "u",
    "•••-": "v",
    "•--": "w",
    "-••-": "x",
    "-•--": "y",
    "--••": "z",
    "-----": "0",
    "•----": "1",
    "••---": "2",
    "•••--": "3",
    "••••-": "4",
    "•••••": "5",
    "-••••": "6",
    "--•••": "7",
    "---••": "8",
    "----•": "9"
]


func decodeMorseCode(morseCode: String) -> String {
    let codeArray = morseCode.components(separatedBy: "  ") .map { $0.split(separator: " ") }
    var decodedString = ""

    for word in codeArray {
        for code in word {
            if let decodedChar = morseCodeMapping[String(code)] {
                decodedString += decodedChar
            } else {
                return "Input has UNDEFINED CHARACTER!"
            }
        }
        decodedString += " "
    }

    return decodedString.trimmingCharacters(in: .whitespaces)
}
