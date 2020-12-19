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
    }
    
    func startGame() {
        
         runCount = 0
         hitNum = 0
         boxNum = 25
   
        boxs.removeAll()
        bullets.removeAll()
        
        updateLabel()
        
        targetTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(createBox), userInfo: nil, repeats: true)
    
//        let delayInSeconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.colide()
        }
    }
}
