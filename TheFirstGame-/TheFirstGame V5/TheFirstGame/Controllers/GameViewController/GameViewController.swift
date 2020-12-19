//
//  ViewController.swift
//  TheFirstGame
//
//  Created by Hanan on 26/11/2020.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    @IBOutlet var fireButton: UIButton!

    //MARK: - Properties

    // Start Game
    @IBOutlet var player: UIButton!
    @IBOutlet var dimond: UIButton!
    
    @IBOutlet var pointsLabel: UILabel!
    @IBOutlet var pointCount: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var timeCount: UILabel!
    
    @IBOutlet var startGameButton: UIButton!

    // Game over Labels
    @IBOutlet var gameIsOverLabel: UILabel!
    @IBOutlet var gameIsOverPointLabel: UILabel!
    @IBOutlet var gameIsOverTimeLabel: UILabel!
    @IBOutlet var gameIsOverPcountLabel: UILabel!
    @IBOutlet var gameIsOverTcountLabel: UILabel!
    
    @IBOutlet var restartGameButton: UIButton!

    //MARK: - Counters
    var hitNum = 0
    var seconed = -1

    //MARK: - Arrays
    var bullets: [UIButton] = []
    var birds: [UIButton] = []
    var moneyBag: [UIButton] = []
    var bricks: [UIButton] = []
    
    
    //MARK: - Timers
    var timeCounter: Timer?
    var brickTimer: Timer?
    var birdTimer: Timer?
    var moneyTimer: Timer?
    var colideTimer: Timer?
    
    
    //MARK: - Audio Players
    var backgroundSound: AVAudioPlayer?
    var fireSound: AVAudioPlayer?
    var playerColidSound: AVAudioPlayer?
    var killBirdSound: AVAudioPlayer?
    var loseSound: AVAudioPlayer?
    var winSound: AVAudioPlayer?
    var catchMoneySound: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        startGameButton.isHidden = false
        
        player.isHidden = true
        dimond.isHidden = true
    
        pointsLabel.isHidden = true
        pointCount.isHidden = true
        timeLabel.isHidden = true
        timeCount.isHidden = true
        
        gameIsOverLabel.isHidden = true
        gameIsOverPointLabel.isHidden = true
        gameIsOverTimeLabel.isHidden = true
        gameIsOverPcountLabel.isHidden = true
        gameIsOverTcountLabel.isHidden = true
        restartGameButton.isHidden = true
        
        audio()
        updateLabel()
        updateTime()
        
        targetAction()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }
    
    func targetAction() {
//      fireButton.addTarget(self, action: #selector(createBullet), for: .touchUpInside)
//      playerTap.addTarget(self, action: #selector(handleTap))
        startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        restartGameButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
    }
    
    func updateLabel() {
        pointCount.text = "\(hitNum)"
    }
    
    func audio() {
        backgroundSound = createPlayer(from: "background")
        fireSound = createPlayer(from: "fire")
        playerColidSound = createPlayer(from: "playerColid")
        killBirdSound = createPlayer(from: "killBird")
        loseSound = createPlayer(from: "lose")
        winSound = createPlayer(from: "win")
        catchMoneySound = createPlayer(from: "catchMoney")
    }
}


