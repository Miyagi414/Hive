//
//  HVToken.swift
//  Spaceship
//
//  Created by Michael Shellenberger on 4/12/18.
//  Copyright © 2018 Michael Shellenberger. All rights reserved.
//

import Foundation
import SpriteKit

enum CollisionCategory : UInt32 {
    case blackSpider1 = 1
    case blackSpider2, blackAnt1 = 4, blackAnt2, blackAnt3, blackGrasshopper1, blackGrasshopper2, blackGrasshopper3, blackBeetle1, blackBeetle2, blackLadybug, blackMosquito, blackQueenBee
    case whiteSpider1, whiteSpider2, whiteAnt1, whiteAnt2, whiteAnt3, whiteGrasshopper1, whiteGrasshopper2, whiteGrasshopper3, whiteBeetle1, whiteBeetle2, whiteLadybug, whiteMosquito, whiteQueenBee
}

struct BoardPosition {
    var column = -1
    var row = -1
}

class HVToken : SKSpriteNode {
    
    var playerColor : PlayerColor
    var isBlocked : Bool
    var inPlay : Bool
    var initialPosition : CGPoint
    var boardPosition : BoardPosition
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        self.boardPosition = BoardPosition(column:0, row:0)
        self.playerColor = PlayerColor.white
        self.isBlocked = false
        self.inPlay = false
        self.initialPosition = CGPoint.zero
        super.init(texture: texture, color: color, size: (texture?.size())!)
    }
    
    convenience init(imageNamed name: String, playerColor: PlayerColor) {
        let texture = SKTexture(imageNamed: name)
        self.init(texture: texture, color: UIColor.clear, size:(texture.size()) )
        
        self.playerColor = playerColor
//        self.zPosition = 3
        
        self.physicsBody = SKPhysicsBody(texture: self.texture!, alphaThreshold: 0.1, size: self.frame.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
//        self.physicsBody?.collisionBitMask = CollisionCategory.blackSpider1.rawValue | CollisionCategory.blackSpider2.rawValue | CollisionCategory.blackAnt1.rawValue | CollisionCategory.blackAnt2.rawValue | CollisionCategory.blackAnt3.rawValue | CollisionCategory.blackGrasshopper1.rawValue | CollisionCategory.blackGrasshopper2.rawValue | CollisionCategory.blackGrasshopper3.rawValue | CollisionCategory.blackBeetle1.rawValue | CollisionCategory.blackBeetle2.rawValue | CollisionCategory.blackLadybug.rawValue | CollisionCategory.blackMosquito.rawValue | CollisionCategory.blackQueenBee.rawValue | CollisionCategory.whiteSpider1.rawValue | CollisionCategory.whiteSpider2.rawValue | CollisionCategory.whiteAnt1.rawValue | CollisionCategory.whiteAnt2.rawValue | CollisionCategory.whiteAnt3.rawValue | CollisionCategory.whiteGrasshopper1.rawValue | CollisionCategory.whiteGrasshopper2.rawValue | CollisionCategory.whiteGrasshopper3.rawValue | CollisionCategory.whiteBeetle1.rawValue | CollisionCategory.whiteBeetle2.rawValue | CollisionCategory.whiteLadybug.rawValue | CollisionCategory.whiteMosquito.rawValue | CollisionCategory.whiteQueenBee.rawValue
        //self.xScale = 5
        //self.yScale = 5
        //self.physicsBody = SKPhysicsBody(rectangleOf: self.frame.size)
        //self.physicsBody?.contactTestBitMask = CollisionCategory.blackSpider1.rawValue | CollisionCategory.blackSpider2.rawValue | CollisionCategory.blackAnt1.rawValue | CollisionCategory.blackAnt2.rawValue | CollisionCategory.blackAnt3.rawValue | CollisionCategory.blackGrasshopper1.rawValue | CollisionCategory.blackGrasshopper2.rawValue | CollisionCategory.blackGrasshopper3.rawValue | CollisionCategory.blackBeetle1.rawValue | CollisionCategory.blackBeetle2.rawValue | CollisionCategory.blackLadybug.rawValue | CollisionCategory.blackMosquito.rawValue | CollisionCategory.blackQueenBee
    }
    
    convenience init(imageNamed name: String, playerColor: PlayerColor, tokenName tName: String) {
        self.init(imageNamed:name, playerColor:playerColor)
        self.name = tName
    }
    
    func setInitial(point: CGPoint) {
        self.initialPosition = point
    }
    
    func resetPosition() {
        self.position = self.initialPosition
    }
    
    func getPlayerColor() -> PlayerColor {
        return self.playerColor
    }
    
    func getBoardPosition() -> BoardPosition {
        return self.boardPosition
    }
}
