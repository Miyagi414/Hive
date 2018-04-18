//
//  MenuScene.swift
//  Hive
//
//  Created by Michael Shellenberger on 4/18/18.
//  Copyright © 2018 Michael Shellenberger. All rights reserved.
//

import SpriteKit
import GameplayKit



class MenuScene: SKScene {

    var startButton : SKSpriteNode!
    var helpButton : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        startButton = childNode(withName: "startButton") as! SKSpriteNode!
        helpButton = childNode(withName: "helpButton") as! SKSpriteNode!
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let location = touches.first?.location(in: self)
//        let touchedNode = self.atPoint(location!)
        
        if startButton.contains(location!) {
            
            if let scene = GKScene(fileNamed: "GameScene") {
                if let sceneNode = scene.rootNode as! GameScene? {
                    sceneNode.scaleMode = .aspectFill
                    if let view = self.view {
                        view.presentScene(sceneNode)
                        
                        view.ignoresSiblingOrder = true
                        
                        view.showsFPS = true
                        view.showsNodeCount = true
                    }
                }
            }
        } else if helpButton.contains(location!) {
            //TODO: add a Help Screen
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
