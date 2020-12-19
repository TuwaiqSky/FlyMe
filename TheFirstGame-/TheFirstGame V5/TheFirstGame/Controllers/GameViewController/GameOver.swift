//
//  GameOver.swift
//  TheFirstGame
//
//  Created by Hanan on 01/12/2020.
//


import UIKit
import AVFoundation

extension GameViewController {
    
    @objc func restartGame() {
        restartGameButton.isHidden = true

        player.isHidden = false
        dimond.isHidden = false
        
        pointsLabel.isHidden = false
        pointCount.isHidden = false
        timeLabel.isHidden = false
        timeCount.isHidden = false
        
        gameIsOverLabel.isHidden = true
        gameIsOverPointLabel.isHidden = true
        gameIsOverTimeLabel.isHidden = true
        gameIsOverPcountLabel.isHidden = true
        gameIsOverTcountLabel.isHidden = true
        
        game()
    }
    
    func gameOver() {
        restartGameButton.isHidden = false

        player.isHidden = true
        dimond.isHidden = true
        
        player.frame = CGRect(x: 185, y: 736, width: 64, height: 107)
        
        pointsLabel.isHidden = true
        pointCount.isHidden = true
        timeLabel.isHidden = true
        timeCount.isHidden = true
        
        gameIsOverLabel.isHidden = false
        gameIsOverPointLabel.isHidden = false
        gameIsOverTimeLabel.isHidden = false
        gameIsOverPcountLabel.isHidden = false
        gameIsOverTcountLabel.isHidden = false
                
        brickTimer?.invalidate()
//      birdTimer?.invalidate()
        moneyTimer?.invalidate()
        timeCounter?.invalidate()
        colideTimer?.invalidate()
        
        backgroundSound?.stop()
        
        gameIsOverPcountLabel.text = pointCount.text
        gameIsOverTcountLabel.text = timeCount.text
        
        
        // Clear View
        for brick in bricks {
            brick.removeFromSuperview()
        }
        
        for money in moneyBag {
                money.removeFromSuperview()
        }
    }
    
}
