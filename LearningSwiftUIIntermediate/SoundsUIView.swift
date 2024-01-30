//
//  SoundsUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 29/01/24.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager() //This is a Singleton created using static 
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada, badum
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound! \(error)")
        }
    }
}

struct SoundsUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("SOUND 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            
            Button("SOUND 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

#Preview {
    SoundsUIView()
}
