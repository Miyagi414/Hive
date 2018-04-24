//
//  GameScene.swift
//  Spaceship
//
//  Created by Michael Shellenberger on 4/10/18.
//  Copyright © 2018 Michael Shellenberger. All rights reserved.
//

import SpriteKit
import GameplayKit

//struct physicsCategory {
//    static let blackSpider1 : UInt32 = 0x1 << 1
//    static let blackSpider2 : UInt32 = 0x1 << 2
//}


class GameScene: SKScene {
    
    var playerBlack : HVPlayer?
    var playerWhite : HVPlayer?
    
    var currentlyHeldPiece : HVToken?
    
//    var cam: SKCameraNode?
    var scaleNum: CGFloat=1
    
    var turnLabel : SKLabelNode?
    var playerTurn : PlayerColor?
    var playableRect: CGRect!
    var boardBackground:SKTileMapNode!
    var highlightBackground : SKTileMapNode!
    var tabletopBackground : SKSpriteNode!
    var highlightTile : SKTileGroup?
    var previousRow : Int!
    var previousColumn : Int!
    var maxBoardRows : Int!
    var maxBoardColumns : Int!
    var whiteDrawer : SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        
        previousRow = 0
        previousColumn = 0
        
        let cam = childNode(withName: "camera") as! SKCameraNode?
        self.camera = cam
//        self.addChild(cam!)
        
        let zoomOutAction = SKAction.scale(to: 2, duration: 2)
        self.camera?.run(zoomOutAction)
        
        guard let boardBackground = childNode(withName: "boardBackground")
            as? SKTileMapNode else {
                fatalError("Background node not loaded")
        }
        self.boardBackground = boardBackground
        self.maxBoardRows = self.boardBackground.numberOfRows
        self.maxBoardColumns = self.boardBackground.numberOfColumns
        
        guard let hlBackground = childNode(withName: "highlightBackground")
            as? SKTileMapNode else {
                fatalError("Background node not loaded")
        }
        self.highlightBackground = hlBackground
        
        guard let ttBackground = childNode(withName: "tableTop")
            as? SKSpriteNode else {
                fatalError("Tabletop Background node not loaded")
        }
        self.tabletopBackground = ttBackground
        
        whiteDrawer = SKSpriteNode()
        whiteDrawer.size = CGSize(width: self.frame.size.height, height: 150)
        whiteDrawer.position = CGPoint(x: -self.frame.size.height/4, y: -self.frame.size.width / 2 + 165)
        whiteDrawer.color = UIColor.red
        whiteDrawer.xScale = 0.5
        whiteDrawer.yScale = 0.5
        whiteDrawer.anchorPoint = CGPoint(x: 0, y: 0)
        
        self.camera?.addChild(whiteDrawer)
        
        currentlyHeldPiece = nil
        playerTurn = PlayerColor.white
        
        playerBlack = HVPlayer(color: PlayerColor.black)
        playerBlack?.addTokens(to: self)
        
        playerWhite = HVPlayer(color: PlayerColor.white)
        playerWhite?.addTokens(to: self.whiteDrawer)
        
        turnLabel = SKLabelNode()
        turnLabel?.text = String(format:"%@%@", "Player turn: ", (playerTurn == PlayerColor.white ? "white" : "black"))
        turnLabel?.fontSize = 12
        turnLabel?.fontName = "Helvetica Neue Bold"
        turnLabel?.fontColor = (playerTurn == PlayerColor.white ? UIColor.white : UIColor.black)
        turnLabel?.position = CGPoint(x: (-self.frame.size.width / 2) + (((turnLabel?.frame.size.width)! / 2) + 5), y: 198)
        self.camera?.addChild(turnLabel!)
        
        let gesture=UIPinchGestureRecognizer(target: self, action: #selector(zoom(recognizer:)))
        self.view!.addGestureRecognizer(gesture)

        let maxAspectRatio:CGFloat=16.0/9.0
        let playableHeight=size.width/maxAspectRatio
        let playableMargin=(size.height-playableHeight)/2.0
        playableRect=CGRect(x:0, y: playableMargin, width: size.width, height: playableHeight)
    
        guard let tileSet = SKTileSet(named: "Highlight Tile Set") else {
            fatalError("Object Tiles Tile Set not found")
        }
        
        let tileGroups = tileSet.tileGroups
        
        guard let hlTile = tileGroups.first else {
            fatalError("No Highlight tile definition found")
        }
        
        self.highlightTile = hlTile
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        let touch : UITouch = touches.first!
        let location = touch.location(in: self.camera!)
    
        let nodes : [SKNode] = (self.camera?.nodes(at: location))!
        
        print("Location: \(location)")
        print("--> nodes \(nodes)")
        
        print(" ")
        if playerTurn == .white {
            if let node = nodes[0] as? HVToken {
                print("found HVToken")
                currentlyHeldPiece = node
                currentlyHeldPiece?.move(toParent: self)
            }
//            for token in (playerWhite?.tokens)! {
//                if token.contains(location) {
//                    currentlyHeldPiece = token
//                }
//            }
        } else {
            for token in (playerBlack?.tokens)! {
                if token.contains(location) {
                    currentlyHeldPiece = token
                }
            }
        }
        
        if currentlyHeldPiece != nil {
            currentlyHeldPiece?.position = location
            currentlyHeldPiece?.zPosition = 100
            currentlyHeldPiece?.physicsBody?.isDynamic = true
        }

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch = touches.first!
        
        let location = touch.location(in: self)
        
        if currentlyHeldPiece != nil {
            currentlyHeldPiece?.position = location
            
            let column = boardBackground.tileColumnIndex(fromPosition: location)
            let row = boardBackground.tileRowIndex(fromPosition: location)
            
            if row != self.previousRow || column != self.previousColumn {
                self.highlightBackground.setTileGroup(nil, forColumn: self.previousColumn , row: self.previousRow)
                self.highlightBackground.setTileGroup(self.highlightTile, forColumn: column, row: row)
                self.previousRow = row
                self.previousColumn = column
            }
            
        } else {
            let positionInScene = touch.location(in:self)
            let previousPosition = touch.previousLocation(in:self)
            let translation = CGPoint(x: positionInScene.x - previousPosition.x, y: positionInScene.y - previousPosition.y)
            
            panForTranslation(translation)
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        if currentlyHeldPiece != nil {
            if playerTurn == .white {
                playerTurn = .black
            } else {
                playerTurn = .white
            }
            
            self.highlightBackground.setTileGroup(nil, forColumn: self.previousColumn , row: self.previousRow)
            self.previousColumn = 0
            self.previousRow = 0
            
            turnLabel?.fontColor = (playerTurn == PlayerColor.white ? UIColor.white : UIColor.black)
            turnLabel?.text = String(format:"%@%@", "Players turn: ", (playerTurn == PlayerColor.white ? "white" : "black"))
            
            let position = currentlyHeldPiece?.position
            let column = boardBackground.tileColumnIndex(fromPosition: position!)
            let row = boardBackground.tileRowIndex(fromPosition: position!)
            
            if column >= 0 && column < self.maxBoardColumns && row >= 0 && row < self.maxBoardRows {
                print("token dropped at row: \(row) column: \(column)")
                let tileCenter = boardBackground.centerOfTile(atColumn: column, row: row)
                currentlyHeldPiece?.position = CGPoint(x: tileCenter.x + 14, y: tileCenter.y - 3)
            } else {
                currentlyHeldPiece?.position = CGPoint(x: 675, y: -325)
            }
            currentlyHeldPiece?.zRotation = 0
            
            currentlyHeldPiece?.zPosition = 0
            currentlyHeldPiece?.physicsBody?.isDynamic = false
        }

        currentlyHeldPiece = nil

    }
    
    func panForTranslation(_ translation: CGPoint) {
        let position = (self.camera?.position)!
        let posX = position.x - translation.x
        let posY = position.y - translation.y
        if testcamera(posX: posX, posY: posY){
            let aNewPosition = CGPoint(x: position.x - translation.x, y: position.y - translation.y)
            self.camera?.position = aNewPosition
        }
    }
    
    func zoom(recognizer: UIPinchGestureRecognizer){
        if recognizer.state == .changed{
            let savedScale=scaleNum
            scaleNum=recognizer.scale
            if scaleNum<1{
                scaleNum=1
            }
            else if scaleNum>3{
                scaleNum=3
            }
            if testcamera(posX: (self.camera!.position.x), posY: (self.camera!.position.y)){
                self.camera?.setScale(scaleNum)
            }
            else{
                scaleNum=savedScale
            }
        }
    }
    
    func testcamera(posX: CGFloat, posY: CGFloat)->Bool{
        var cameraRect : CGRect {
            let xx = posX - size.width/2*scaleNum
            let yy = posY - playableRect.height/2*scaleNum
            return CGRect(x: xx, y: yy, width: size.width*scaleNum, height: playableRect.height*scaleNum)
        }
        let backGroundRect=CGRect(x: tabletopBackground.position.x-tabletopBackground.frame.width/2, y: tabletopBackground.position.y-tabletopBackground.frame.height/2, width: tabletopBackground.frame.width, height: tabletopBackground.frame.height)

        return backGroundRect.contains(cameraRect)
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
}
