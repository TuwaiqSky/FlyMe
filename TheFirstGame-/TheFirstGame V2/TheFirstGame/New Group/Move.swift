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
        y: gestureView.center.y
    )
    
    sender.setTranslation(.zero, in: view)
    
    let leftSideRestrction = self.view.frame.minX
    let rightSideRestriction = self.view.frame.maxX
    
    let spaceShipCurrentOrginXValue = self.player.frame.origin.x
    let spaceShipCurrentOrginYValue = self.player.frame.origin.y
    
    let spaceShipHeight = self.player.frame.size.height
    let spaceShipWidth = self.player.frame.size.width
    
    let spaceShipRightEdgePosition = spaceShipCurrentOrginXValue + spaceShipWidth
    
    if spaceShipCurrentOrginXValue <= leftSideRestrction {
        
        player.frame = CGRect(x: leftSideRestrction, y: spaceShipCurrentOrginYValue, width: spaceShipWidth, height: spaceShipHeight)
    }
    
    if spaceShipRightEdgePosition >= rightSideRestriction{
        
        player.frame = CGRect(x: rightSideRestriction - spaceShipWidth, y: spaceShipCurrentOrginYValue, width: spaceShipWidth, height: spaceShipHeight)
    }
}
    
}
