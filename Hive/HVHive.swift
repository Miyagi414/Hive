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
        if self.hive.isEmpty {
            let validPositions = [BoardPosition(column:11, row:11),
                                  BoardPosition(column:12, row:11),
                                  BoardPosition(column:11, row:12),
                                  BoardPosition(column:12, row:12),
                                  BoardPosition(column:13, row:12),
                                  BoardPosition(column:12, row:13),
                                  BoardPosition(column:11, row:13)]
            
            return validPositions
        } else {
            if token.inPlay == false {
                let validPositions = self.getOutsideEdge()
                
                return validPositions
            } else {
                let validPositions = [BoardPosition(column:1, row:1)]
                return validPositions
                
            }
        }
    }
    
    func add(token: HVToken) {
        if token.inPlay == false {
            token.inPlay = true
            self.hive.append(token)
        } else {
            //TODO: should only add new token
        }
    }
    
    func getOutsideEdge() -> [BoardPosition] {
        
        var edgePositions : [BoardPosition] = []
        
        for token in self.hive {
            let tokenPosition = token.boardPosition
            let row = tokenPosition.row
            let column = tokenPosition.column
            
            edgePositions.append(contentsOf: [BoardPosition(column:column - 1, row:row - 1),
                              BoardPosition(column:column, row:row - 1),
                              BoardPosition(column:column - 1, row:row),
                              BoardPosition(column:column + 1, row:row),
                              BoardPosition(column:column - 1, row:row + 1),
                              BoardPosition(column:column, row:row + 1)])
        }
        
        for token in self.hive {
            let tokenPosition = token.boardPosition
            let row = tokenPosition.row
            let column = tokenPosition.column
            
            let index = edgePositions.index(where: { $0.column == column && $0.row == row })
            if index != nil && index! > -1 && index! < self.hive.count {
                print("Index: \(index)")
                
                edgePositions.remove(at: index!)
            }
            
        }
        
        return edgePositions
    }
}
