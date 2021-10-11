//
//  PlayerViewModel.swift
//  Task02
//
//  Created by Fardan Akhter on 10/11/21.
//

import Foundation
import AVFoundation

//MARK:- PlayViewModel
class PlayViewModel: NSObject, Identifiable {
    
    var audioName: String
    var fileType: String
    
    init(audioName: String, fileType: String) {
        self.audioName = audioName
        self.fileType = fileType
    }
    
    private var audioPlayer: AVAudioPlayer?
    
    func play() {
        guard (self.audioPlayer?.isPlaying ?? false) == false else{ return }
        let sound = Bundle.main.path(forResource: audioName, ofType: fileType)
        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        self.audioPlayer?.play()
        self.audioPlayer?.delegate = self
    }
    
    func stop() {
        self.audioPlayer?.stop()
    }
}

//MARK:- Delegate AVAudioPlayer
extension PlayViewModel: AVAudioPlayerDelegate{
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.play()
    }
}
