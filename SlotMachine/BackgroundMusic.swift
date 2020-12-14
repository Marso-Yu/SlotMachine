//
//  SoundEffect.swift
//  SlotMachine
//
//  Created by Marso on 2020/12/13.
//

import AVFoundation
struct BackgroundMusic {
    let player = AVPlayer()
    var looper: AVPlayerLooper?

    func play(fileName: String?, fileExtension: String?){
        guard let mp3FileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {return}
        let playerItem = AVPlayerItem(url:mp3FileUrl)
        player.replaceCurrentItem(with: playerItem)
        player.volume = 0.3
        player.play()
        
    }

    mutating func loopPlay(fileName: String?, fileExtension: String?){
        if let mp3FileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        {
            let loopPlayer = AVQueuePlayer()
            let item = AVPlayerItem(url: mp3FileUrl)
            looper = AVPlayerLooper(player: loopPlayer, templateItem: item)
            loopPlayer.play()

        }
    }
    
    func speak(sentence: String?){
        guard let sentence = sentence else {return}
        let speechUtterance = AVSpeechUtterance(string: sentence)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
}

