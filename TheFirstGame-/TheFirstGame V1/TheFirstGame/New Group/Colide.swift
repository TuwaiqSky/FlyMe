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
           
            for box in self.boxs {
                
                if box.frame.intersects(self.spaceShip.frame) {
                    
                    self.targetTimer?.invalidate()
                    
                    for box in self.boxs {
                        box.removeFromSuperview()
                    }
                 
                    self.gameOverAlert()
                                        
                }
                
                for bullet in self.bullets {
                    if bullet.frame.intersects(box.frame) {
                        bullet.removeFromSuperview()
                        box.removeFromSuperview()
                        
                        if let boxIndex = self.boxs.firstIndex(of: box), let bulletIndex = self.bullets.firstIndex(of: bullet) {
                            self.boxs.remove(at: boxIndex)
                            self.bullets.remove(at: bulletIndex)
                        }
                        
                        self.hitNum += 1
                        self.updateLabel()
                    }
                }
            }
        }
    }
}
