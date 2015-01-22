// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol Flight {
    var wings: Bool { get set }
    var beakSize: Int { get set }
    
//    func canFly(animal:Animal) -> Bool {
//    return true
//    }
    
}

protocol Talk {
    func speak() -> String
}


class Animal {
    var legs: Int = 4
    var fur: Bool = true
    var hasClaws: Bool
    
    init (hasClaws: Bool) {
        self.hasClaws = hasClaws
        self.legs = 4
        println("hello world")
    }
    
//    func speak() {
//        println("Hello World")
//    }
    
    func describeAnimal() {
        println("This animal has \(self.legs) legs.")
    }
}

class Penguin: Animal, Flight {
    var wings = true
    var beakSize = 4

}

var penguinJoe = Penguin(hasClaws: true)

class Human: Animal, Talk {
    func speak() -> String {
        return "Hello World"
    }
}

var rob = Human(hasClaws: false)
rob.legs = 2
rob.fur = false
rob.speak()









var tedi = Animal(hasClaws: true)


class Dog: Animal {
    
    override var fur:Bool {
        get {
            return super.fur
        } set {
            super.fur = newValue
        }
    }
    
//    override func speak() {
//        super.speak()
//        println("Woof Woof")
//    }
    
}
var hercules = Dog(hasClaws: true)
//tedi.speak()
//hercules.speak()
hercules.hasClaws = false


func doesAnimalHaveClaws(animal:Animal) -> Bool {
    return animal.hasClaws
}
doesAnimalHaveClaws(hercules)




struct Rectangle {
    var width: Int
    var height: Int
    var x: Int?
    var y: Int?
    
    func getArea() -> Int {
        return width * height
    }
    
}

let rect1 = Rectangle(width: 40, height: 40,x: nil, y: nil)
let rect2 = Rectangle(width: 50, height: 100,x: 0, y: 0)
rect1.getArea()
rect2.getArea()





















