//
//  ViewController.swift
//  TheFirstGame
//
//  Created by Hanan on 26/11/2020.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    @IBOutlet var playerTap: UITapGestureRecognizer!
    
    @IBOutlet var player: UIButton!
    @IBOutlet var boxCount: UILabel!
    @IBOutlet var hitCount: UILabel!
    @IBOutlet var startingGame: UIButton!
    @IBOutlet var fireButton: UIButton!
    
    var startTimer: Timer?
    var birdTimer: Timer?
    var moneyTimer: Timer?
    var lineTimer: Timer?
    var colideTimer: Timer?
    
    var runCount = 1
    var hitNum = 0
    var targetNum = 0
    var targetTotal = 35.0
        
    var bullets: [UIButton] = []
    var boxs: [UIButton] = []
    var moneyBag: [UIButton] = []
    var killerLines: [UILabel] = []

     var backgroundSound: AVAudioPlayer?
     var fireSound: AVAudioPlayer?
     var playerColidSound: AVAudioPlayer?
     var killBirdSound: AVAudioPlayer?
     var lostSound: AVAudioPlayer?
     var winSound: AVAudioPlayer?
     var catchMoneySound: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

        fireButton.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        playerTap.addTarget(self, action: #selector(handleTap))
        
        updateLabel()
        
        backgroundSound = createPlayer(from: "background")
        fireSound = createPlayer(from: "fire")
        playerColidSound = createPlayer(from: "playerColid")
        killBirdSound = createPlayer(from: "killBird")
        lostSound = createPlayer(from: "lose")
        winSound = createPlayer(from: "win")
        catchMoneySound = createPlayer(from: "catchMoney")

    }
    
    func updateLabel() {
        boxCount.text = "\(targetNum)"
        hitCount.text = "\(hitNum)"
    }

}


