//
//  HVPlayer.swift
//  Spaceship
//
//  Created by Michael Shellenberger on 4/14/18.
//  Copyright © 2018 Michael Shellenberger. All rights reserved.
//

import Foundation
import SpriteKit


enum PlayerColor : Int {
    case white = 1
    case black = 2
    case neutral = 3
}


class HVPlayer {
    
    var tokens: [HVToken] = []
    var playerColor : PlayerColor
    
    init() {
        self.playerColor = PlayerColor.neutral
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color:PlayerColor) {
        var xPosition : CGFloat
        
        self.init()
        self.playerColor = color
        
        let tokenSpider1 = HVToken(imageNamed: (self.playerColor == .white ? "SpiderWhite" : "SpiderBlack"), playerColor: color, tokenName: "tokenSpider1")
        let tokenSpider2 = HVToken(imageNamed: (self.playerColor == .white ? "SpiderWhite" : "SpiderBlack"), playerColor: color, tokenName: "tokenSpider2")
        let tokenAnt1 = HVToken(imageNamed: (self.playerColor == .white ? "AntWhite" : "AntBlack"), playerColor: color, tokenName: "tokenAnt1")
        let tokenAnt2 = HVToken(imageNamed: (self.playerColor == .white ? "AntWhite" : "AntBlack"), playerColor: color, tokenName: "tokenAnt2")
        let tokenAnt3 = HVToken(imageNamed: (self.playerColor == .white ? "AntWhite" : "AntBlack"), playerColor: color, tokenName: "tokenAnt3")
        let tokenGrasshopper1 = HVToken(imageNamed: (self.playerColor == .white ? "GrasshopperWhite" : "GrasshopperBlack"), playerColor: color, tokenName: "tokenGrasshopper1")
        let tokenGrasshopper2 = HVToken(imageNamed: (self.playerColor == .white ? "GrasshopperWhite" : "GrasshopperBlack"), playerColor: color, tokenName: "tokenGrasshopper2")
        let tokenGrasshopper3 = HVToken(imageNamed: (self.playerColor == .white ? "GrasshopperWhite" : "GrasshopperBlack"), playerColor: color, tokenName: "tokenGrasshopper3")
        let tokenBeetle1 = HVToken(imageNamed: (self.playerColor == .white ? "BeetleWhite" : "BeetleBlack"), playerColor: color, tokenName: "tokenBeetle1")
        let tokenBeetle2 = HVToken(imageNamed: (self.playerColor == .white ? "BeetleWhite" : "BeetleBlack"), playerColor: color, tokenName: "tokenBeetle2")
        let tokenLadybug = HVToken(imageNamed: (self.playerColor == .white ? "LadybugWhite" : "LadybugBlack"), playerColor: color, tokenName: "tokenLadybug")
        let tokenMosquito = HVToken(imageNamed: (self.playerColor == .white ? "MosquitoWhite" : "MosquitoBlack"), playerColor: color, tokenName: "tokenMosquito")
        let tokenQueenBee = HVToken(imageNamed: (self.playerColor == .white ? "QueenBeeWhite" : "QueenBeeBlack"), playerColor: color, tokenName: "tokenQueenBee")
        
        switch self.playerColor {
        case .white:
            
            xPosition = 675
            tokenSpider1.physicsBody?.categoryBitMask = CollisionCategory.whiteSpider1.rawValue
            tokenSpider2.physicsBody?.categoryBitMask = CollisionCategory.whiteSpider2.rawValue
            tokenAnt1.physicsBody?.categoryBitMask = CollisionCategory.whiteAnt1.rawValue
            tokenAnt2.physicsBody?.categoryBitMask = CollisionCategory.whiteAnt2.rawValue
            tokenAnt3.physicsBody?.categoryBitMask = CollisionCategory.whiteAnt3.rawValue
            tokenGrasshopper1.physicsBody?.categoryBitMask = CollisionCategory.whiteGrasshopper1.rawValue
            tokenGrasshopper2.physicsBody?.categoryBitMask = CollisionCategory.whiteGrasshopper2.rawValue
            tokenGrasshopper3.physicsBody?.categoryBitMask = CollisionCategory.whiteGrasshopper3.rawValue
            tokenBeetle1.physicsBody?.categoryBitMask = CollisionCategory.whiteBeetle1.rawValue
            tokenBeetle2.physicsBody?.categoryBitMask = CollisionCategory.whiteBeetle2.rawValue
            tokenLadybug.physicsBody?.categoryBitMask = CollisionCategory.whiteLadybug.rawValue
            tokenMosquito.physicsBody?.categoryBitMask = CollisionCategory.whiteMosquito.rawValue
            tokenQueenBee.physicsBody?.categoryBitMask = CollisionCategory.whiteQueenBee.rawValue
            
        case .black:
            
            xPosition = -675
            tokenSpider1.physicsBody?.categoryBitMask = CollisionCategory.blackSpider1.rawValue
            tokenSpider2.physicsBody?.categoryBitMask = CollisionCategory.blackSpider2.rawValue
            tokenAnt1.physicsBody?.categoryBitMask = CollisionCategory.blackAnt1.rawValue
            tokenAnt2.physicsBody?.categoryBitMask = CollisionCategory.blackAnt2.rawValue
            tokenAnt3.physicsBody?.categoryBitMask = CollisionCategory.blackAnt3.rawValue
            tokenGrasshopper1.physicsBody?.categoryBitMask = CollisionCategory.blackGrasshopper1.rawValue
            tokenGrasshopper2.physicsBody?.categoryBitMask = CollisionCategory.blackGrasshopper2.rawValue
            tokenGrasshopper3.physicsBody?.categoryBitMask = CollisionCategory.blackGrasshopper3.rawValue
            tokenBeetle1.physicsBody?.categoryBitMask = CollisionCategory.blackBeetle1.rawValue
            tokenBeetle2.physicsBody?.categoryBitMask = CollisionCategory.blackBeetle2.rawValue
            tokenLadybug.physicsBody?.categoryBitMask = CollisionCategory.blackLadybug.rawValue
            tokenMosquito.physicsBody?.categoryBitMask = CollisionCategory.blackMosquito.rawValue
            tokenQueenBee.physicsBody?.categoryBitMask = CollisionCategory.blackQueenBee.rawValue
        case .neutral:
            xPosition = 0
        }
        
        
        tokenSpider1.position = CGPoint(x: xPosition, y: 325)
        tokenSpider2.position = CGPoint(x: xPosition, y: 325)
        tokenAnt1.position = CGPoint(x: xPosition, y: 197)
        tokenAnt2.position = CGPoint(x: xPosition, y: 197)
        tokenAnt3.position = CGPoint(x: xPosition, y: 197)
        tokenGrasshopper1.position = CGPoint(x: xPosition, y: 69)
        tokenGrasshopper2.position = CGPoint(x: xPosition, y: 69)
        tokenGrasshopper3.position = CGPoint(x: xPosition, y: 69)
        tokenBeetle1.position = CGPoint(x: xPosition, y: -69)
        tokenBeetle2.position = CGPoint(x: xPosition, y: -69)
        tokenLadybug.position = CGPoint(x: xPosition, y: -197)
        tokenMosquito.position = CGPoint(x: xPosition, y: -325)
        
        switch self.playerColor {
        case .white:
            xPosition -= 150
        case .black:
            xPosition += 150
        case .neutral:
            break
        }
        
        tokenQueenBee.position = CGPoint(x: xPosition, y: 0)
        
        self.tokens = [ tokenSpider1, tokenSpider2, tokenAnt1, tokenAnt2, tokenAnt3, tokenGrasshopper1, tokenGrasshopper2, tokenGrasshopper3, tokenBeetle1, tokenBeetle2, tokenLadybug, tokenMosquito, tokenQueenBee ]
    }
    
    func addTokens(to node:SKNode) {
        for token in self.tokens {
            node.addChild(token)
        }
    }
}


