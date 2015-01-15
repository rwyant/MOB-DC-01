//
//  GoodPlayer.swift
//  Peer Programming - A Game
//
//  Created by Rob Wyant on 1/15/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import Foundation

class GoodPlayer {
    
    var myGoodPlayer = Player()
    
    //Attack One -- Uppercut to the FACE! Worth 38 points.
    func one () -> (String,Int) {

        myGoodPlayer.message = "Uppercut to the FACE!"
        myGoodPlayer.damage = 38
        myGoodPlayer.attack()
        var result = (myGoodPlayer.message,myGoodPlayer.damage)
        return result
    }
    
    //Attack Two -- Low Blow! Worth 42 points.
    func two () -> (String, Int) {
        myGoodPlayer.message = "Low blow [embarassed emoji]."
        myGoodPlayer.damage = 42
        myGoodPlayer.attack()
        var result = (myGoodPlayer.message,myGoodPlayer.damage)
        return result
    }

    //Randomizing Attack for Good Player
    func randomizedAttack () {
        var random = rand()
        if random % 2 == 0 {
            one()
        } else {
            two()
        }
    }
    
}




