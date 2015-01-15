// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var view = UIView(frame: CGRect(x:0,y:0,width:200,height:200))
view.backgroundColor = UIColor.orangeColor()

class Animal {
    var species: String = ""
    var legs: Int = 0
    init(legs:Int,species:String) {
        self.legs = legs
        self.species = species
    }
    
    func speak() {
        println("AHHHH")
    }
}

class Dog: Animal {
    var isSmart = true
    override func speak() {
        println("Wooof")
    }
}

var doggie = Dog(legs: 4,species:"Dog")



doggie.legs
doggie.speak()