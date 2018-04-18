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

    var startButton : SKShapeNode!
    var helpButton : SKShapeNode!
    
    override func didMove(to view: SKView) {
        startButton = childNode(withName: "startButton") as! SKShapeNode!
        helpButton = childNode(withName: "helpButton") as! SKShapeNode!
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let location = touches.first?.location(in: self)
        let touchedNode = self.atPoint(location!)
        
        if touchedNode == startButton {
            
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
        } else if touchedNode == helpButton {
            //TODO: add a Help Screen
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
