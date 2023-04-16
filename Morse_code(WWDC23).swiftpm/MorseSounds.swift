import SwiftUI
import AVFoundation

struct PlaySounds: View {
    let morseCodePlayer = MorseCodePlayer()
    var body: some View {
        Button {
            morseCodePlayer.playCode(".--..- .")
        } label: {
            Text("Click")
        }
    }
}
