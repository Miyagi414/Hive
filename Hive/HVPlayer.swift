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
    var drawer : SKSpriteNode!
    
    init() {
        self.playerColor = PlayerColor.neutral
        self.drawer = SKSpriteNode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color:PlayerColor) {
        
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
        
        tokenSpider1.position = CGPoint(x: 215, y: 75)
        tokenSpider2.position = CGPoint(x: 225, y: 75)
        tokenAnt1.position = CGPoint(x: 363, y: 75)
        tokenAnt2.position = CGPoint(x: 373, y: 75)
        tokenAnt3.position = CGPoint(x: 383, y: 75)
        tokenGrasshopper1.position = CGPoint(x: 521, y: 75)
        tokenGrasshopper2.position = CGPoint(x: 531, y: 75)
        tokenGrasshopper3.position = CGPoint(x: 541, y: 75)
        tokenBeetle1.position = CGPoint(x: 679, y: 75)
        tokenBeetle2.position = CGPoint(x: 689, y: 75)
        tokenLadybug.position = CGPoint(x: 827, y: 75)
        tokenMosquito.position = CGPoint(x: 965, y: 75)
        tokenQueenBee.position = CGPoint(x: 1113, y: 75)
        
        
        tokenSpider1.setInitial(point: CGPoint(x: 215, y: 75))
        tokenSpider2.setInitial(point: CGPoint(x: 225, y: 75))
        tokenAnt1.setInitial(point: CGPoint(x: 363, y: 75))
        tokenAnt2.setInitial(point: CGPoint(x: 373, y: 75))
        tokenAnt3.setInitial(point: CGPoint(x: 383, y: 75))
        tokenGrasshopper1.setInitial(point: CGPoint(x: 521, y: 75))
        tokenGrasshopper2.setInitial(point: CGPoint(x: 531, y: 75))
        tokenGrasshopper3.setInitial(point: CGPoint(x: 541, y: 75))
        tokenBeetle1.setInitial(point: CGPoint(x: 679, y: 75))
        tokenBeetle2.setInitial(point: CGPoint(x: 689, y: 75))
        tokenLadybug.setInitial(point: CGPoint(x: 827, y: 75))
        tokenMosquito.setInitial(point: CGPoint(x: 965, y: 75))
        tokenQueenBee.setInitial(point: CGPoint(x: 1113, y: 75))


        
        self.tokens = [ tokenSpider1, tokenSpider2, tokenAnt1, tokenAnt2, tokenAnt3, tokenGrasshopper1, tokenGrasshopper2, tokenGrasshopper3, tokenBeetle1, tokenBeetle2, tokenLadybug, tokenMosquito, tokenQueenBee ]
    }
    
    func addTokens(to node:SKNode, on scene:SKNode) {
        
        
        self.drawer.size = CGSize(width: scene.frame.size.height, height: 150)
        self.drawer.position = CGPoint(x: -scene.frame.size.height/4, y: -scene.frame.size.width / 2 + 165)
        self.drawer.zPosition = 100
        self.drawer.xScale = 0.5
        self.drawer.yScale = 0.5
        self.drawer.anchorPoint = CGPoint(x: 0, y: 0)
        
        switch self.playerColor {
        case .white:
            self.drawer.color = UIColor.black
        case .black:
            self.drawer.color = UIColor.white
        case .neutral:
            self.drawer.color = UIColor.clear
            break
        }

        
        node.addChild(self.drawer)
        
        for token in self.tokens {
            self.drawer.addChild(token)
        }
    }
    
    func hideDrawer() {
        self.drawer.alpha = 0
    }
    
    func showDrawer() {
        self.drawer.alpha = 1
    }
}


