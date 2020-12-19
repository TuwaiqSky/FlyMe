//
//  Create.swift
//  TheFirstGame
//
//  Created by Hanan on 28/11/2020.
//

import UIKit

extension GameViewController {
    
    // This func allow player to create and release bullets
//    @objc func handleTap (_ sender: UITapGestureRecognizer) {
//        createBullet()
//    }
//
//    @objc func createBullet() {
//        let newBullet = UIButton()
//        newBullet.setImage(UIImage(named: "bullet"), for: .normal)
//        
//        let newBulletX = self.player.frame.origin.x + 10
//        let newBulletY = self.player.frame.origin.y - 40
//
//        newBullet.contentEdgeInsets.top = -4
//        newBullet.contentEdgeInsets.left = -2
//
//        newBullet.frame =  CGRect(x: newBulletX, y: newBulletY, width:16 , height:26)
//        view.addSubview(newBullet)
//        fireSound?.play()
//
//        let _ = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
//            newBullet.frame.origin.y += (-10)
//        }
//        bullets.append(newBullet)
//    }
//
//    // this function creates birds
//    @objc func createBird() {
//        let newBird = UIButton()
//
//        let birdColor = Int.random(in: 0...3)
//        let birdsArray = ["bird1", "bird2", "bird3", "bird4"]
//        newBird.setImage(UIImage(named: birdsArray[birdColor]), for: .normal)
//
//        adjustTargetFrame(newBird)
//        birds.append(newBird)
//
//        updateLabel()
//    }
    
    //this fucntion creates money
    @objc func createMoney() {
        let newMoney = UIButton()
        newMoney.setImage(UIImage(named: "money"), for: .normal)
        
        adjustTargetFrame(newMoney)
        moneyBag.append(newMoney)
    }
    
    // this func adjust target's frame
    func adjustTargetFrame(_ target: UIButton) {
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
    
    // this function create bricks
    func createBrick(_ styleNum: Int) {
        let brickOne = UIButton()
        let brickTwo = UIButton()

        brickOne.setImage(UIImage(named: "rightBrick"), for: .normal)
        brickTwo.setImage(UIImage(named: "leftBrick"), for: .normal)
        

        switch styleNum {
        case 1:
            brickOne.frame = CGRect(x: 0, y: -50, width: 103, height: 8)
            brickTwo.frame = CGRect(x: 305, y: -50, width: 110, height: 8)
            
        case 2:
            brickOne.frame = CGRect(x: 304, y: -50, width: 110, height: 8)
            brickTwo.frame = CGRect(x: 201, y: -50, width: 103, height: 8)
            
        case 3:
            brickOne.frame = CGRect(x: 110, y: -50, width: 103, height: 8)
            brickTwo.frame = CGRect(x: 0, y: -50, width: 110, height: 8)
            
        case 4:
            brickOne.frame = CGRect(x: 229, y: -50, width: 185, height: 8)
            brickTwo.frame = CGRect(x: 0, y: -50, width: 50, height: 8)
            
        case 5:
            brickOne.frame = CGRect(x: 364, y: -50, width: 50, height: 8)
            brickTwo.frame = CGRect(x: 0, y: -50, width: 185, height: 8)

        default:
            break
        }
        

        adjustBrickFrame(brickOne)
        adjustBrickFrame(brickTwo)

       
        bricks.append(brickOne)
        bricks.append(brickTwo)
 
        view.addSubview(brickOne)
        view.addSubview(brickTwo)

        let _ = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            brickOne.frame.origin.y += 10
            brickTwo.frame.origin.y += 10
        }
   }
    
    // this func adjust brick's frame
    func adjustBrickFrame(_ brick: UIButton) {
        brick.contentEdgeInsets.left = -280
        brick.contentEdgeInsets.right = -230
        brick.contentEdgeInsets.bottom = -170
        brick.contentEdgeInsets.top = -65
        brick.imageEdgeInsets.left = 56
        brick.imageEdgeInsets.top = -100
    }
   
}
