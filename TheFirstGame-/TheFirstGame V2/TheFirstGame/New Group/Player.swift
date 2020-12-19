//
//  Player.swift
//  TheFirstGame
//
//  Created by Hanan on 29/11/2020.
//

import UIKit
import AVFoundation

extension GameViewController {
    
    func createPlayer(from filename: String) -> AVAudioPlayer? {
      guard let url = Bundle.main.url(
        forResource: filename,
        withExtension: "mp3"
        ) else {
          return nil
      }
      var player = AVAudioPlayer()

      do {
        try player = AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
      } catch {
        print("Error loading \(url.absoluteString): \(error)")
      }

      return player
    }
   
}


