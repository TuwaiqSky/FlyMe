//
//  Start.swift
//  TheFirstGame
//
//  Created by Hanan on 28/11/2020.
//

import UIKit

extension GameViewController {
    
    @objc func startGame() {
        startGameButton.isHidden = true
        
        player.isHidden = false
        dimond.isHidden = false
        
        pointsLabel.isHidden = false
        pointCount.isHidden = false
        timeLabel.isHidden = false
        timeCount.isHidden = false
        
        game()
    }
    

    @objc func game() {
        hitNum = 0
        seconed = -1

        updateLabel()
        
        // start timers
        brickLoop()
//      birdLoop()
        moneyLoop()
        timeLoop()
        colide()
        
        // Clear All Arrays
        clearArrays()
        
        // play background audio
        backgroundSound?.play()
    }

    func clearArrays() {
        birds.removeAll()
        bullets.removeAll()
        moneyBag.removeAll()
        bricks.removeAll()
    }
    
    // create brick
    func startBrick() {
            let randomStyle = Int.random(in: 1...5)
            self.createBrick(randomStyle)
    }
    
    // Timers
    func brickLoop() {
        brickTimer = Timer.scheduledTimer(withTimeInterval: 0.9, repeats: true) { timer in
            self.startBrick()
        }
    }
    
//    func birdLoop() {
//        birdTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
//            self.createBird()
//            self.startBrick()
//        }
//    }
    
    func moneyLoop() {
        moneyTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.createMoney()
        }
    }
    
    func timeLoop() {
        timeCounter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTime)), userInfo: nil, repeats: true)
    }
    

    // update time count
    @objc func updateTime() {
        seconed += 1
        timeCount.text = "\(seconed)"
        timeCount.text = timeString(time: TimeInterval(seconed))
    }

    // time formatter
    func timeString(time: TimeInterval) -> String {
        let mns = Int(time) / 60 % 60
        let sec = Int(time) % 60
        return String(format: "%0i:%02i", mns,sec)
    }
}
