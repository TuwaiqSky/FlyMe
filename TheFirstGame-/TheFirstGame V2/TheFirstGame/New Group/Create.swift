//
//  Create.swift
//  TheFirstGame
//
//  Created by Hanan on 28/11/2020.
//

import UIKit

extension GameViewController {
    
    @IBAction func handleTap (_ sender: UITapGestureRecognizer) {
        
        let newBullet = UIButton()
    
        newBullet.setImage(UIImage(named: "bullet"), for: .normal)
        
        let newBulletX = self.player.frame.origin.x + 20
        let newBulletY = self.player.frame.origin.y - 40
        
        newBullet.frame =  CGRect(x: newBulletX, y: newBulletY, width:20 , height:80)
        
        view.addSubview(newBullet)
        fireSound?.play()
        
        let _ = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            newBullet.frame.origin.y += (-10)
        }
        
        bullets.append(newBullet)
        
    }
    
    @objc func createBox() {
                
        let newBird = UIButton()
        
        let birdColor = Int.random(in: 0...3)
        
        let birds = ["bird1", "bird2", "bird3", "bird4"]
        
        newBird.setImage(UIImage(named: birds[birdColor]), for: .normal)
        
        let x = Double.random(in: 50...350)
        newBird.frame = CGRect(x: x, y: -50.0, width: 80, height: 60)
        
        view.addSubview(newBird)
        
        let _ = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            newBird.frame.origin.y += 10
        }
        
        runCount += 1
        if runCount == 25 {
        
        self.targetTimer?.invalidate()
            
            let delayInSeconds = 2.5
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                
                self.gameFinishAlert()
                self.backgroundSound?.stop()
            }
        }
        
        boxs.append(newBird)
        
        boxNum -= 1
        updateLabel()
    }
}
