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
//          self.birdColide()
//          self.brickCoilde()
            self.moneyColide()
        }
    }
    
    func playerColide() {
        if dimond.frame.intersects(player.frame) {
            gameOver()
            winSound?.play()
        }
        
            for brick in bricks {
                if brick.frame.intersects(self.player.frame) {
                    gameOver()
                    loseSound?.play()
                }
            }
        
//        for bird in birds {
//            if bird.frame.intersects(player.frame) {
//                for bird in birds {
//                    bird.removeFromSuperview()
//                }
//                gameOver()
//                loseSound?.play()
//            }
//        }
    }
    
    
//    func birdColide() {
//        for bird in birds {
//        for bullet in bullets {
//            if bullet.frame.intersects(bird.frame) {
//                bullet.removeFromSuperview()
//                bird.removeFromSuperview()
//
//               hitNum += 1
//               updateLabel()
//               killBirdSound?.play()
//
//                if let boxIndex = birds.firstIndex(of: bird), let bulletIndex = bullets.firstIndex(of: bullet) {
//                    birds.remove(at: boxIndex)
//                    bullets.remove(at: bulletIndex)
//                }
//            }
//        }
//    }
//}

//func brickCoilde() {
//    for bird in birds {
//        for brick in bricks {
//            if bird.frame.intersects(brick.frame) {
//                bird.removeFromSuperview()
//
//                if let birdIndex = birds.firstIndex(of: bird) {
//                    birds.remove(at: birdIndex)
//                }
//            }
//        }
//    }
//}


func moneyColide(){
    for money in moneyBag {
        if money.frame.intersects(player.frame) {
            money.removeFromSuperview()
            
            if let moneyIndex = moneyBag.firstIndex(of: money){
                moneyBag.remove(at: moneyIndex)
                
                hitNum += 5
                updateLabel()
                catchMoneySound?.play()
            }
        }
    }
}
}




