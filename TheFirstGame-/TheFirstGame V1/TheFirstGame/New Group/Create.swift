//
//  Create.swift
//  TheFirstGame
//
//  Created by Hanan on 28/11/2020.
//

import UIKit

extension GameViewController {
    
    @IBAction func handleTap (_ sender: UITapGestureRecognizer) {
        
        let newBullet = UILabel()
        
        newBullet.backgroundColor = .gray
        
        let newBulletX = self.spaceShip.frame.origin.x + 20
        let newBulletY = self.spaceShip.frame.origin.y - 40
        
        newBullet.frame =  CGRect(x: newBulletX, y: newBulletY, width:20, height:40)
        
        view.addSubview(newBullet)
        
        let _ = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            newBullet.frame.origin.y += (-10)
        }
        
        bullets.append(newBullet)

    }
    
    @objc func createBox() {
        
        let newBox = UILabel()
        newBox.backgroundColor = .red
        
        let x = Double.random(in: 50...350)
        newBox.frame = CGRect(x: x, y: -50.0, width: 40, height: 40)
        
        view.addSubview(newBox)
        
        let _ = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            newBox.frame.origin.y += 10
        }
        
        runCount += 1
        if runCount == 25 {
        
        self.targetTimer?.invalidate()

            let delayInSeconds = 2.5
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                
                self.gameFinishAlert()
            }
        }
        
        boxs.append(newBox)
        
        boxNum -= 1
        updateLabel()
    }
}
