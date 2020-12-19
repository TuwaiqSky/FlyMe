//
//  Colide.swift
//  TheFirstGame
//
//  Created by Hanan on 28/11/2020.
//

import UIKit

extension GameViewController {
    
    func colide() {
        colideTimer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { timer in
            self.playerColide()
            self.birdColide()
            self.moneyColide()
        }
    }
    
    func playerColide() {
        
        if dimond.frame.intersects(self.player.frame) {
            dimond.removeFromSuperview()
        
            self.winSound?.play()
            self.backgroundSound?.stop()
            self.gameFinishAlert()
        }
    
        
        for box in self.birds {
            if box.frame.intersects(self.player.frame) {
                for box in self.birds {
                    box.removeFromSuperview()
                    
                    if let boxIndex = self.birds.firstIndex(of: box){
                        self.birds.remove(at: boxIndex)
                    }
                    self.gameOverAlert()
                }
            }
        }
    }
    
    func birdColide(){
        for bird in self.birds {
            for bullet in self.bullets {
                if bullet.frame.intersects(bird.frame) {
                    bullet.removeFromSuperview()
                    bird.removeFromSuperview()
                    
                    if let boxIndex = self.birds.firstIndex(of: bird), let bulletIndex = self.bullets.firstIndex(of: bullet) {
                        self.birds.remove(at: boxIndex)
                        self.bullets.remove(at: bulletIndex)
                        self.killBirdSound?.play()
                    }
                    
                    self.hitNum += 1
                    self.updateLabel()
                }
            }
            
            for brick in self.bricks {
                if bird.frame.intersects(brick.frame) {
                    bird.removeFromSuperview()

                    if let birdIndex = self.birds.firstIndex(of: bird) {
                        self.birds.remove(at: birdIndex)
                    }
                }
            }
            
        }
    }
    
    func moneyColide(){
        for money in self.moneyBag {
            if money.frame.intersects(self.player.frame) {
                money.removeFromSuperview()
                
                if let moneyIndex = self.moneyBag.firstIndex(of: money){
                    self.moneyBag.remove(at: moneyIndex)
                    
                    self.hitNum += 5
                    self.updateLabel()
                    self.catchMoneySound?.play()
                }
            }
        }
    }
}




