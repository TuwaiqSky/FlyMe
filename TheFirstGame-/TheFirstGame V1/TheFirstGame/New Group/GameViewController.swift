//
//  ViewController.swift
//  TheFirstGame
//
//  Created by Hanan on 26/11/2020.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var spaceShip: UILabel!
    @IBOutlet var boxCount: UILabel!
    @IBOutlet var hitCount: UILabel!
    
    var targetTimer: Timer?
    var colideTimer: Timer?
    
    var runCount = 0
    var hitNum = 0
    var boxNum = 0
        
    var bullets: [UILabel] = []
    var boxs: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        updateLabel()
    }
    
    func updateLabel() {
        boxCount.text = "\(boxNum)"
        hitCount.text = "\(hitNum)"
    }
    
    func scoreResult() -> String {
       
        let hits = Double(hitNum)
        var score: Double = (hits / 25) * 100
        var result = Int(score)
        
        var message = ""
        if result > 50 {
            message = "you won , Your score is \(result)% Awesome!"
        } else {
            message = "You lost, your score is \(result) % "
        }
        return message
    }
    
    func gameOverAlert(){
        let alert = UIAlertController(
            title: "Game Over",
            message: "You lost!",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "ok",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func gameFinishAlert(){
        
        let alert = UIAlertController(
            title: "Score",
            message: self.scoreResult(),
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "ok",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}


