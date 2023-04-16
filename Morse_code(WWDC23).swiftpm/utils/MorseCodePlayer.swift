
import AVFoundation

class MorseCodePlayer {
    let dotDuration = 0.11 // dot sounds duration
    let dashDuration = 0.3 //dot sounds duration
    let pauseDuration = 0.1
    
    var dotPlayer: AVAudioPlayer?
    var dashPlayer: AVAudioPlayer?
    
    init() {
        // Load Sounds File (dot, dash)
        let dotSound = Bundle.main.path(forResource: "dot", ofType: "wav")
        let dashSound = Bundle.main.path(forResource: "dash", ofType: "wav")
        
        do {
            dotPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: dotSound!))
            dashPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: dashSound!))
            
            dotPlayer?.volume = 1.0
            dashPlayer?.volume = 1.0
        } catch {
            print("Error: Failed to load sound file.")
        }
    }
    
    func playCode(code: String) {
        // Use DispatchQueue to play characters sequentially
        DispatchQueue.global(qos: .userInteractive).async {
            for char in code {
                switch char {
                case "•":
                    self.dotPlayer?.play()
                    Thread.sleep(forTimeInterval: self.dotDuration)
                case "-":
                    self.dashPlayer?.play()
                    Thread.sleep(forTimeInterval: self.dashDuration)
                case " ":
                    Thread.sleep(forTimeInterval: self.pauseDuration)
                default:
                    break
                }
                
                Thread.sleep(forTimeInterval: self.pauseDuration)
            }
        }
    }
}
