//
//  BadPlayer.swift
//  Peer Programming - A Game
//
//  Created by Rob Wyant on 1/15/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import Foundation

class BadPlayer {
    
    var myBadPlayer = Player()
    
    //Attack One -- Uppercut to the FACE! Worth 38 points.
    func one () -> (String,Int) {
        
        myBadPlayer.message = "Flick!"
        myBadPlayer.damage = 8
        myBadPlayer.attack()
        var result = (myBadPlayer.message,myBadPlayer.damage)
        return result
    }
    
    //Attack Two -- Low Blow! Worth 42 points.
    func two () -> (String, Int) {
        myBadPlayer.message = "Indian Burn!"
        myBadPlayer.damage = 12
        myBadPlayer.attack()
        var result = (myBadPlayer.message,myBadPlayer.damage)
        return result
    }
    
    //Randomizing Attack for Bad Player
    func randomizedAttack () {
        var random = rand()
        if random % 2 == 0 {
            one()
        } else {
            two()
        }
    }
    
}