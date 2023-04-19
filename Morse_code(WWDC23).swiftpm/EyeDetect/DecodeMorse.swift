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
            VStack{
                LinearGradient(
                    colors: [.white, .pink],
                    startPoint: .topLeading,
                    endPoint: .bottom
                )
                .mask(
                    Text("After Decoding")
                        .font(Font.system(size: 50, weight: .bold))
                        .multilineTextAlignment(.center)
                )
                .frame(height: 200)
                
                HStack {
                    Text("Morse Code")
                        .foregroundColor(.pink)
                        .font(.custom(.muktaBold, size: 20))
                        .padding(10)
                        .padding(.leading, 20)
                        
                    Spacer()
                    
                    Text(userInput)
                        .font(.custom(.concertOne, size: 25))
                    
                    Spacer()
                }
                .frame(height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal, 40)
                
                HStack {
                    Text("Decryption")
                        .foregroundColor(.pink)
                        .font(.custom(.muktaBold, size: 20))
                        .padding(10)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Text(decodeMorseCode(morseCode: userInput))
                        .font(.custom(.concertOne, size: 25))
                        .foregroundColor(decodeMorseCode(morseCode: userInput) != "Input has UNDEFINED CHARACTER!" ? .blue : .red)
                        .padding(.horizontal, 40)
                    
                    Spacer()
                }
                .frame(height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal, 40)
                
                if decodeMorseCode(morseCode: userInput) != "Input has UNDEFINED CHARACTER!" {
                    // Flash & Sound
                    HStack (spacing: 120) {
                        // Flash
                        Button {
                            flashMorseCode(morseCode: userInput)
                        } label: {
                            Image(systemName: "lightbulb.led")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .foregroundColor(.black)
                        }
                        
                        // Sound
                        Button {
                            MorseCodePlayer().playCode(code: userInput)
                        } label: {
                            Image(systemName: "waveform.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 40)
    
                    HStack (spacing: 70) {
                        Text("Light Flash")
                            .font(.system(size: 20).weight(.black))
                            .foregroundColor(.black)
                        Text("Sound Play")
                            .font(.system(size: 20).weight(.black))
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 30)
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.clockwise.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.red)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            
                            Text("Retry")
                                .font(.custom(.concertOne, size: 25))
                                .foregroundColor(.red)
                                .padding(.horizontal, 10)
                        }
                        .padding(.bottom, 15)
                    }
                    
                } else {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.clockwise.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.red)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            
                            Text("Retry")
                                .font(.custom(.concertOne, size: 25))
                                .foregroundColor(.red)
                                .padding(.horizontal, 10)
                        }
                        .padding(.top, 120)
                    }
                }
            }
        }
    }
}


let morseCodeMapping: [String: String] = [
    "•-": "A",
    "-•••": "B",
    "-•-•": "C",
    "-••": "D",
    "•": "E",
    "••-•": "F",
    "--•": "G",
    "••••": "H",
    "••": "I",
    "•---": "J",
    "-•-": "K",
    "•-••": "L",
    "--": "M",
    "-•": "N",
    "---": "O",
    "•--•": "P",
    "--•-": "Q",
    "•-•": "R",
    "•••": "S",
    "-": "T",
    "••-": "U",
    "•••-": "V",
    "•--": "W",
    "-••-": "X",
    "-•--": "Y",
    "--••": "Z",
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
