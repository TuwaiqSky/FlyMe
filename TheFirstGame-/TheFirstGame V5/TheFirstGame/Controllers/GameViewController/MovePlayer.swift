//
//  Move.swift
//  TheFirstGame
//
//  Created by Hanan on 28/11/2020.
//


import UIKit

extension GameViewController {
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        guard let gestureView = sender.view else {
            return
        }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
        )
        
        sender.setTranslation(.zero, in: view)
        
        let leftSideRestrction = self.view.frame.minX
        let rightSideRestriction = self.view.frame.maxX
    
        let topSideRestrction = self.view.frame.minY
        let bottomSideRestriction = self.view.frame.maxY
        
        let playerCurrentOrginXValue = self.player.frame.origin.x
        let playerCurrentOrginYValue = self.player.frame.origin.y
        
        let playerHeight = self.player.frame.size.height
        let playerWidth = self.player.frame.size.width
        
        let playerRightEdgePosition = playerCurrentOrginXValue + playerWidth
        let playerbottomEdgePosition = playerCurrentOrginYValue + playerHeight
        
        
        if playerCurrentOrginXValue <= leftSideRestrction {
            player.frame = CGRect(x: leftSideRestrction, y: playerCurrentOrginYValue, width: playerWidth, height: playerHeight)
        }
        
        if playerRightEdgePosition >= rightSideRestriction{
            player.frame = CGRect(x: rightSideRestriction - playerWidth, y: playerCurrentOrginYValue, width: playerWidth, height: playerHeight)
        }
        
        if playerCurrentOrginYValue <= topSideRestrction {
            player.frame = CGRect(x: leftSideRestrction, y: topSideRestrction, width: playerWidth, height: playerHeight)
        }
        
        if playerbottomEdgePosition >= bottomSideRestriction{
            player.frame = CGRect(x: rightSideRestriction, y: bottomSideRestriction - playerHeight, width: playerWidth, height: playerHeight)
        }
    }
    
}
