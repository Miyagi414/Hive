//
//  HVEngine.swift
//  Hive
//
//  Created by Michael Shellenberger on 4/25/18.
//  Copyright © 2018 Michael Shellenberger. All rights reserved.
//

import Foundation
import SpriteKit

class HVEngine {
    
    var playerBlack : HVPlayer
    var playerWhite : HVPlayer
    var playerTurn : PlayerColor
    var hive : HVHive
    
    init() {
        hive = HVHive()
        
        playerBlack = HVPlayer(color: PlayerColor.black)
        playerWhite = HVPlayer(color: PlayerColor.white)
        playerTurn = PlayerColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(on node:SKScene) {
        self.init()
        self.playerBlack.addTokens(to: node.camera!, on: node)
        self.playerWhite.addTokens(to: node.camera!, on: node)
        
        self.playerBlack.hideDrawer()
        self.playerWhite.showDrawer()
    }
    
    func switchPlayers() {
        if self.playerTurn == .white {
            self.playerTurn = .black
            self.playerWhite.hideDrawer()
            self.playerBlack.showDrawer()
        } else {
            self.playerTurn = .white
            self.playerBlack.hideDrawer()
            self.playerWhite.showDrawer()
        }
    }
    
    
    func activePlayer() -> HVPlayer {
        return (self.playerTurn == .white ? self.playerWhite : self.playerBlack)
    }
    
    func activeColor() -> PlayerColor {
        return self.playerTurn
    }
    
    func getValidPositions(for token:HVToken) -> [BoardPosition] {
        
        return self.hive.getValidMoves(for: token)
    }
}
