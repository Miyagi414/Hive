//
//  HVHive.swift
//  Hive
//
//  Created by Michael Shellenberger on 4/30/18.
//  Copyright © 2018 Michael Shellenberger. All rights reserved.
//

import Foundation
import SpriteKit


class HVHive {
    var hive : [HVToken] = []
    
    init() {
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getValidMoves(for token:HVToken) -> [BoardPosition] {
        if token.inPlay == false {
            let validPositions = [BoardPosition(column:11, row:11),
                                  BoardPosition(column:12, row:11),
                                  BoardPosition(column:11, row:12),
                                  BoardPosition(column:12, row:12),
                                  BoardPosition(column:13, row:12),
                                  BoardPosition(column:12, row:13),
                                  BoardPosition(column:11, row:13)]
            
            return validPositions
        } else {
            let validPositions = [BoardPosition(column:1, row:1)]
            return validPositions

        }
        
    }
}
