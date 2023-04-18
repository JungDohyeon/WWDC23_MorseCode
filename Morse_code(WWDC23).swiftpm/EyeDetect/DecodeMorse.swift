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
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                        .padding(10)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .padding(.leading, 20)
                        
                    Spacer()
                    
                    Text(userInput)
                        .font(.custom(.concertOne, size: 25))
                    
                    Spacer()
                }
                .frame(height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal, 20)
                
                HStack {
                    Image(systemName: "lock.open.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                        .padding(10)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Text(decodeMorseCode(morseCode: userInput))
                        .font(.custom(.concertOne, size: 25))
                        .foregroundColor(decodeMorseCode(morseCode: userInput) != "Input has UNDEFINED CHARACTER!" ? .green : .red)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .frame(height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal, 20)
                
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
                                .frame(width: 50)
                                .foregroundColor(.blue)
                        }
                        
                        // Sound
                        Button {
                            MorseCodePlayer().playCode(code: userInput)
                        } label: {
                            Image(systemName: "waveform.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70)
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


//struct DecodeMorse_Previews: PreviewProvider {
//    static var previews: some View {
//        DecodeMorse()
//    }
//}
