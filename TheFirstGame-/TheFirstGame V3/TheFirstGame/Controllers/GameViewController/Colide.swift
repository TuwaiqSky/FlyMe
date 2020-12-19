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
            self.lineColide()
            self.moneyColide()
        }
    }
    
    func playerColide() {
        for box in self.boxs {
            if box.frame.intersects(self.player.frame) {
                for box in self.boxs {
                    box.removeFromSuperview()
                    
                    if let boxIndex = self.boxs.firstIndex(of: box){
                        self.boxs.remove(at: boxIndex)
                    }
                }
                self.playerColidSound?.play()
                self.backgroundSound?.stop()
                self.gameOverAlert()
            }
        }
    }
    
    func birdColide(){
        for box in self.boxs {
            for bullet in self.bullets {
                if bullet.frame.intersects(box.frame) {
                    bullet.removeFromSuperview()
                    box.removeFromSuperview()
                    
                    if let boxIndex = self.boxs.firstIndex(of: box), let bulletIndex = self.bullets.firstIndex(of: bullet) {
                        self.boxs.remove(at: boxIndex)
                        self.bullets.remove(at: bulletIndex)
                        self.killBirdSound?.play()
                    }
                    self.hitNum += 1
                    self.updateLabel()
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
                }
                self.hitNum += 5
                self.updateLabel()
                self.catchMoneySound?.play()
            }
        }
    }
    
    func lineColide(){
        for lines in self.killerLines {
            if lines.frame.intersects(self.player.frame) {
                for killerLine in self.killerLines {
                    killerLine.removeFromSuperview()
                    
                    if let killerLineIndex = self.killerLines.firstIndex(of: killerLine){
                        self.killerLines.remove(at: killerLineIndex)
                    }
                }
                self.playerColidSound?.play()
                self.backgroundSound?.stop()
                self.gameOverAlert()
            }
        }
    }
    
}




