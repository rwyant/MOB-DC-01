// Playground - noun: a place where people can play
import Foundation
import UIKit





class Animal {
    var species: String = ""
    var legs: Int = 0
    

    func speak() {
        println("AHHHH")
    }
}

class Dog: Animal {
    var isSmart = true
//    init(legs) {
//        
//    }
    override func speak() {
        println("Wooof")
    }
}

var doggie = Dog()
doggie.legs
doggie.speak()


//func printAnimalName(animal:Animal) {
//    println("Animal's name is \(animal.name)")
//}
//var doggie = Animal()
//doggie.name = "Hercules"
//printAnimalName(doggie)



