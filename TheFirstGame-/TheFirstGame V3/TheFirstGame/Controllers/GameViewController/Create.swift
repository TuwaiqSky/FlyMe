//
//  Create.swift
//  TheFirstGame
//
//  Created by Hanan on 28/11/2020.
//

import UIKit

extension GameViewController {
    
    @objc func handleTap (_ sender: UITapGestureRecognizer) {
        
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
    
    @objc func createBird() {
        let newBird = UIButton()
        
        let birdColor = Int.random(in: 0...3)
        let birds = ["bird1", "bird2", "bird3", "bird4"]
        newBird.setImage(UIImage(named: birds[birdColor]), for: .normal)
        
        addTarget(newBird)
        boxs.append(newBird)
        
        targetNum -= 1
        updateLabel()
    }
    
    @objc func createMoney() {
        let newMoney = UIButton()
        newMoney.setImage(UIImage(named: "money"), for: .normal)
        
        addTarget(newMoney)
        moneyBag.append(newMoney)
    }
    
     func createKillerLine(_ styleNum: Int) {
        let newLeftLine = UILabel()
        let newRightLine = UILabel()
        
        newLeftLine.backgroundColor = .gray
        newRightLine.backgroundColor = .gray
        
        switch styleNum {
        case 1:
            newRightLine.frame = CGRect(x: 0, y: -50, width: 103, height: 8)
            newLeftLine.frame = CGRect(x: 305, y: -50, width: 110, height: 8)
            
        case 2:
            newRightLine.frame = CGRect(x: 304, y: -50, width: 110, height: 8)
            newLeftLine.frame = CGRect(x: 201, y: -50, width: 103, height: 8)
            
        case 3:
            newRightLine.frame = CGRect(x: 110, y: -50, width: 103, height: 8)
            newLeftLine.frame = CGRect(x: 0, y: -50, width: 110, height: 8)
            
        case 4:
            newRightLine.frame = CGRect(x: 229, y: -50, width: 185, height: 8)

            newLeftLine.frame = CGRect(x: 0, y: -50, width: 50, height: 8)
            
        case 5:
            newRightLine.frame = CGRect(x: 364, y: -50, width: 50, height: 8)
            newLeftLine.frame = CGRect(x: 0, y: -50, width: 185, height: 8)

        default:
            break
        }
        
        view.addSubview(newRightLine)
        view.addSubview(newLeftLine)
        
        killerLines.append(newRightLine)
        killerLines.append(newLeftLine)
        
        
        let _ = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            newLeftLine.frame.origin.y += 10
            newRightLine.frame.origin.y += 10
        }
        round()
    }
    
    
    func addTarget(_ target: UIButton) {
        target.contentMode = .scaleAspectFill
        let x = Double.random(in: 50...350)
        target.frame = CGRect(x: x, y: -50.0, width: 80, height: 60)
        
        view.addSubview(target)
        
        let _ = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            target.frame.origin.y += 10
        }
        round()
    }
    
    func round() {
        runCount += 1
        if runCount == Int(targetTotal) {
            let delayInSeconds = 2.5
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                self.gameFinishAlert()
                self.backgroundSound?.stop()
            }
        }
    }
}
