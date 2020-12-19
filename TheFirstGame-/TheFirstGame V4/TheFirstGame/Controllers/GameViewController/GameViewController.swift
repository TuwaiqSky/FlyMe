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
    @IBOutlet var hitCount: UILabel!
    @IBOutlet var startingGame: UIButton!
    @IBOutlet var fireButton: UIButton!
    @IBOutlet var timeCount: UILabel!
    @IBOutlet var dimond: UIButton!
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var pointsLabel: UILabel!
    
    var timeCounter: Timer?
    var startTimer: Timer?
    var birdTimer: Timer?
    var moneyTimer: Timer?
    var colideTimer: Timer?
    
    var hitNum = 0
    var seconed = -1

    var bullets: [UIButton] = []
    var birds: [UIButton] = []
    var moneyBag: [UIButton] = []
    var bricks: [UIButton] = []

     var backgroundSound: AVAudioPlayer?
     var fireSound: AVAudioPlayer?
     var playerColidSound: AVAudioPlayer?
     var killBirdSound: AVAudioPlayer?
     var lostSound: AVAudioPlayer?
     var winSound: AVAudioPlayer?
     var catchMoneySound: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        player.isHidden = true
        dimond.isHidden = true
        timeLabel.isHidden = true
        pointsLabel.isHidden = true
        hitCount.isHidden = true
        timeCount.isHidden = true

        updateLabel()
        updateTimer()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

        fireButton.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        playerTap.addTarget(self, action: #selector(handleTap))
                
        backgroundSound = createPlayer(from: "background")
        fireSound = createPlayer(from: "fire")
        playerColidSound = createPlayer(from: "playerColid")
        killBirdSound = createPlayer(from: "killBird")
        lostSound = createPlayer(from: "lose")
        winSound = createPlayer(from: "win")
        catchMoneySound = createPlayer(from: "catchMoney")
    }
    
    func updateLabel() {
        hitCount.text = "\(hitNum)"
    }
}


