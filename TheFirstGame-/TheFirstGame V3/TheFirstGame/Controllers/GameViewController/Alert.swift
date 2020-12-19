//
//  alert.swift
//  TheFirstGame
//
//  Created by Hanan on 30/11/2020.
//

import UIKit

extension GameViewController {
    
    func gameOverAlert(){
        
        startTimer?.invalidate()
        moneyTimer?.invalidate()

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
        
        startTimer?.invalidate()
        moneyTimer?.invalidate()
        
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
        let score: Double = (hits / targetTotal) * 100
        let result = Int(score)
        
        if result > 50 {
            winSound?.play()
        } else {
            lostSound?.play()
        }
    }
}
