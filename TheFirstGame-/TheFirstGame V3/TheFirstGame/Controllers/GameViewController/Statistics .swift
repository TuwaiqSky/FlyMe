//
//  Statistics .swift
//  TheFirstGame
//
//  Created by Hanan on 30/11/2020.
//

import UIKit

extension GameViewController {
    
    func scoreResult() -> String {
        
        let hits = Double(hitNum)
        let score: Double = (hits / targetTotal) * 100
        let result = Int(score)
        
        var message = ""
        if result > 50 {
            message = "you won , Your score is \(result)% Awesome!"
        } else {
            message = "You lost, your score is \(result)% "
        }
        return message
    }
}
