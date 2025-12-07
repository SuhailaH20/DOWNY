//
//  Text2Speach.swift
//  DOWNY
//
//  Created by Suhaylah hawsawi on 12/06/1447 AH.
//

import AVFoundation

class AudioPlayerManager {
    static let shared = AudioPlayerManager()
    private var player: AVAudioPlayer?
    func playSound(named fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            print("not found: \(fileName)")
            return}

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error: \(error)")
        }
    }
}



//class SpeechManager {
//    static let shared = SpeechManager()
//    private let synthesizer = AVSpeechSynthesizer()
//
//    func speak(_ text: String) {
//        let utterance = AVSpeechUtterance(string: text)
//        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
//        utterance.rate = 0.45
//        synthesizer.speak(utterance)
//    }
//
//    func stop() {
//        synthesizer.stopSpeaking(at: .immediate)
//    }
//}
