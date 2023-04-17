//
//  DecodeMorse.swift
//  Morse_code(WWDC23)
//
//  Created by 정도현 on 2023/04/17.
//

import SwiftUI

struct DecodeMorse: View {
    @Binding var userInput: String
    
    var body: some View {
        VStack {
            Text("User Input: \(userInput)")
            Text("After Decoding: \(decodeMorseCode(morseCode: userInput))")
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
    let codeArray = morseCode.split(separator: " ")
    var decodedString = ""
    
    for code in codeArray {
        if let decodedChar = morseCodeMapping[String(code)] {
            decodedString += decodedChar
        } else {
            decodedString += "?"
        }
    }
    
    return decodedString
}
