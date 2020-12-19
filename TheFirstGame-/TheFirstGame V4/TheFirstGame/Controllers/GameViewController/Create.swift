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
        
        let newBulletX = self.player.frame.origin.x + 10
        let newBulletY = self.player.frame.origin.y - 40
        
        newBullet.contentEdgeInsets.top = -4
        newBullet.contentEdgeInsets.left = -2

        newBullet.frame =  CGRect(x: newBulletX, y: newBulletY, width:16 , height:26)
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
        let birdsArray = ["bird1", "bird2", "bird3", "bird4"]
        newBird.setImage(UIImage(named: birdsArray[birdColor]), for: .normal)
        
        addTarget(newBird)
        birds.append(newBird)

        updateLabel()
    }
    
    @objc func createMoney() {
        let newMoney = UIButton()
        newMoney.setImage(UIImage(named: "money"), for: .normal)
        
        addTarget(newMoney)
        moneyBag.append(newMoney)
    }
    
    func addTarget(_ target: UIButton) {
        target.contentMode = .scaleAspectFill
        let x = Double.random(in: 50...350)
        target.frame = CGRect(x: x, y: -50.0, width: 58, height: 50)
        
        target.contentEdgeInsets.top = -10
        target.contentEdgeInsets.bottom = -20
        target.contentEdgeInsets.left = -15
        target.contentEdgeInsets.right = -40

        target.imageEdgeInsets.bottom = 10
        target.imageEdgeInsets.right = 20

        
        view.addSubview(target)
        
        let _ = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            target.frame.origin.y += 10
        }
    }
    
    func createBrick(_ styleNum: Int) {
        let brickOne = UIButton()
        let brickTwo = UIButton()
        let brickThree = UIButton()
        let brickFour = UIButton()

       switch styleNum {
       case 1:
        
        brickOne.setImage(UIImage(named: "lefBrick"), for: .normal)
        brickTwo.setImage(UIImage(named: "rightBrick"), for: .normal)
        brickThree.setImage(UIImage(named: "lefBrick"), for: .normal)
        brickFour.setImage(UIImage(named: "rightBrick"), for: .normal)

        brickOne.frame = CGRect(x: 0, y: 671, width: 167, height: 30)
        brickTwo.frame = CGRect(x: 256, y: 509, width: 167, height: 30)
        brickThree.frame = CGRect(x: 0, y: 321, width: 167, height: 30)
        brickFour.frame = CGRect(x: 247, y: 183, width: 167, height: 30)

       case 2:
        brickOne.setImage(UIImage(named: "rightBrick"), for: .normal)
        brickTwo.setImage(UIImage(named: "leftBrick"), for: .normal)
        brickThree.setImage(UIImage(named: "rightBrick"), for: .normal)
        brickFour.setImage(UIImage(named: "leftBrick"), for: .normal)

        brickOne.frame = CGRect(x: 247, y: 657, width: 167, height: 30)
        brickTwo.frame = CGRect(x: 0, y: 511, width: 167, height: 30)
        brickThree.frame = CGRect(x: 247, y: 319, width: 167, height: 30)
        brickFour.frame = CGRect(x: 0, y: 163, width: 167, height: 30)

       default:
           break
       }
  
        addBrick(brickOne)
        addBrick(brickTwo)
        addBrick(brickThree)
        addBrick(brickFour)
       
        bricks.append(brickOne)
        bricks.append(brickTwo)
        bricks.append(brickThree)
        bricks.append(brickFour)
   }
    
    func addBrick(_ brick: UIButton) {
        brick.contentEdgeInsets.left = -280
        brick.contentEdgeInsets.right = -230
        brick.contentEdgeInsets.bottom = -170
        brick.contentEdgeInsets.top = -65

        brick.imageEdgeInsets.left = 56
        brick.imageEdgeInsets.top = -100
        
        view.addSubview(brick)
    }
}
