//
//  alert.swift
//  TheFirstGame
//
//  Created by Hanan on 30/11/2020.
//

import UIKit

extension GameViewController {
    
    func gameOverAlert(){
        
        startTimer?.invalidate()
        moneyTimer?.invalidate()
        
        player.isHidden = true
        dimond.isHidden = true
        timeLabel.isHidden = true
        pointsLabel.isHidden = true
        hitCount.isHidden = true

        
        let alert = UIAlertController(
            title: "Game Over",
            message: "You lost!",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "ok",
            style: .default) {
            UIAlertAction in
            self.showStart()
        }
        
        self.playerColidSound?.play()
        self.backgroundSound?.stop()
       
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
        
        for brick in self.bricks {
            brick.removeFromSuperview()
            bricks.removeAll()
        }
            
        
    }
    
    func gameFinishAlert(){
        
        startTimer?.invalidate()
        moneyTimer?.invalidate()
        
        player.isHidden = true
        dimond.isHidden = true
        timeLabel.isHidden = true
        pointsLabel.isHidden = true
        hitCount.isHidden = true

        let alert = UIAlertController(
            title: "Score",
            message: self.scoreResult(),
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "ok",
            style: .default)  {
            UIAlertAction in
            self.showStart()
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)

        for brick in self.bricks {
            brick.removeFromSuperview()
            bricks.removeAll()
        }
    }
}
