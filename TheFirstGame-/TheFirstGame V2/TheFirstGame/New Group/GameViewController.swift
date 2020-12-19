//
//  ViewController.swift
//  TheFirstGame
//
//  Created by Hanan on 26/11/2020.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
//    @IBOutlet var playerTap: UITapGestureRecognizer!
    
    @IBOutlet var player: UIButton!
    @IBOutlet var boxCount: UILabel!
    @IBOutlet var hitCount: UILabel!
    @IBOutlet var startingGame: UIButton!
    
    var targetTimer: Timer?
    var colideTimer: Timer?
    
    var runCount = 0
    var hitNum = 0
    var boxNum = 0
        
    var bullets: [UIButton] = []
    var boxs: [UIButton] = []
    
     var backgroundSound: AVAudioPlayer?
     var fireSound: AVAudioPlayer?
     var playerColidSound: AVAudioPlayer?
     var killBirdSound: AVAudioPlayer?
     var lostSound: AVAudioPlayer?
    var winSound: AVAudioPlayer?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

        updateLabel()
        
        backgroundSound = createPlayer(from: "background")
        fireSound = createPlayer(from: "fire")
        playerColidSound = createPlayer(from: "playerColid")
        killBirdSound = createPlayer(from: "killBird")
        lostSound = createPlayer(from: "lose")
        winSound = createPlayer(from: "win")

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
            message = "You lost, your score is \(result)% "
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
            style: .default) {
            UIAlertAction in
            self.showStart()
        }
        
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
            style: .default)  {
            UIAlertAction in
            self.showStart()
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
        let hits = Double(hitNum)
        var score: Double = (hits / 25) * 100
        var result = Int(score)
        
        if result > 50 {
            winSound?.play()
        } else {
            lostSound?.play()
        }
    }
    
}


