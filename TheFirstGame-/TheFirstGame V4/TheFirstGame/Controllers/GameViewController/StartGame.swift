//
//  Start.swift
//  TheFirstGame
//
//  Created by Hanan on 28/11/2020.
//

import UIKit

extension GameViewController {
    
    @IBAction func startButton(_ sender: Any) {
        runTimer()
        startGame()
        backgroundSound?.play()
    }
    
    func startGame() {
        self.startingGame.isHidden = true
       
        self.player.isHidden = false
        self.dimond.isHidden = false
        self.timeLabel.isHidden = false
        self.pointsLabel.isHidden = false
        self.hitCount.isHidden = false

        hitNum = 0
  
        updateLabel()
        palyGameTimer()
        startBrick()

        birds.removeAll()
        bullets.removeAll()
        
        startTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            self.palyGameTimer()
        }
        
        moneyTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            self.createMoney()
        }
    }
    

    func runTimer() {
        timeCounter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        seconed += 1
        timeCount.text = "\(seconed)"
        timeCount.text = timeString(time: TimeInterval(seconed))
    }

    func timeString(time: TimeInterval) -> String {
        let mns = Int(time) / 60 % 60
        let sec = Int(time) % 60
        return String(format: "%0i:%02i", mns,sec)
    }
    
    func palyGameTimer(){
        self.createBird()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.colide()
        }
    }
    
    func startBrick() {
        let randonMap = Int.random(in: 1...2)
        createBrick(randonMap)
        
    }
    
    func showStart() {
        self.startingGame.isHidden = false
        
    }
}
