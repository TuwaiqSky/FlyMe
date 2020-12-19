//
//  Start.swift
//  TheFirstGame
//
//  Created by Hanan on 28/11/2020.
//

import UIKit

extension GameViewController {
    
    @IBAction func startButton(_ sender: Any) {
        startGame()
        backgroundSound?.play()
    }
    
    func startGame() {
        self.startingGame.isHidden = true
        
        runCount = 1
        hitNum = 0
        targetNum = Int(targetTotal)
        updateLabel()
        
        boxs.removeAll()
        bullets.removeAll()
                
        startTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            self.palyGameTimer()
        }
        
        moneyTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            self.createMoney()
        }
    }
    
    func palyGameTimer(){
        
        if runCount == 3 ||
            
            runCount == 7 ||
            runCount == 8 ||
            
            runCount == 10 ||
            runCount == 11 ||
            runCount == 12 ||
            
            runCount == 15 ||
            
            runCount == 20 ||
            runCount == 21 ||
            runCount == 22 ||
            runCount == 23 ||
            
            
            runCount == 30 ||
            runCount == 31  {
            
            let delayInSeconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                let randomLine = Int.random(in: 1...5)
                self.createKillerLine(randomLine)
            }
            
        } else {
            self.createBird()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.colide()
        }
    }
    
    func showStart() {
        self.startingGame.isHidden = false
    }
}
