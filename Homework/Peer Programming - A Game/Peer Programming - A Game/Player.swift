//
//  Player.swift
//  Peer Programming - A Game
//
//  Created by Rob Wyant on 1/15/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import Foundation

class Player {
    var message = "Boom!"
    var damage = 0
    var health = 100
    func isAlive() -> Bool {
        var isAlive = true
        if health > 0 {
            isAlive = true
        } else {
            isAlive = false
        }
        return isAlive
    }
    func attack () -> (String,Int) {
        var result = (message, damage)
        return result
        
    }
    
}
