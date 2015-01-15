// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


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

class BadPlayer {
    
    var myBadPlayer = Player()
    
    //Attack One -- Flick! Worth 8 points.
    func one () -> (String,Int) {
        
        myBadPlayer.message = "Flick!"
        myBadPlayer.damage = 8
        myBadPlayer.attack()
        var result = (myBadPlayer.message,myBadPlayer.damage)
        return result
    }
    
    //Attack Two -- Indian Burn! Worth 12 points.
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

class Match {
    var goodPlayer = GoodPlayer()
    var badPlayer = BadPlayer()
    
    
}

var matchPlay = Match()
matchPlay.goodPlayer.randomizedAttack()


