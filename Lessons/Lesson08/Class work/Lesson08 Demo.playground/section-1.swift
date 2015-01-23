// Playground - noun: a place where people can play

import UIKit

protocol Flight {
    var wings: Bool { get set }
    var beakSize: Int { get set }
}

protocol Talk {
    func speak() -> String
}





class Animal {
    
    
    var legs: Int
    var fur: Bool = false
    var hasClaws: Bool
    
    init(hasClaws: Bool, legs: Int) {
        self.hasClaws = hasClaws
        self.legs = legs
        println("Hello there")
    }
    
    func speak() {
        println("Hello world")
    }
    
    func describeAnimal() {
        println("This animal has \(self.legs) legs")
    }
}

class Penguin: Animal, Flight {
    var wings = true
    var beakSize = 6
}



class Human:Animal, Talk {
    func speak() -> String{
        return "Hello world"
    }
}

class Dog: Animal {
    var cat = Animal(hasClaws: true, legs: 4)
//    override var fur: Bool {
//        get {
//            //return whatever the fur variable is set as
//            return true
//        }
//        set {
//            // override the inhertied property to the new value set by the sub class
//            super.fur = newValue
//        }
//    }
    override func speak() {
        // super.method also runs the method that the class inherited from
        super.speak()
        println("Woof woof")
    }
    
}

//var tedi = Animal(hasClaws: true, legs: 2)
var ena = Dog(hasClaws: true, legs: 4)
ena.speak()
var skippy = ena
ena.legs
skippy.legs = 5
ena.legs

struct Rectangle {
    var width: Int
    var height: Int
    
    func getArea() -> Int {
        return width * height
    }
}

func doesAnimalHaveClaws(passingAnimal: Animal) -> Bool {
    return passingAnimal.hasClaws
}
let tedi = Animal(hasClaws: true, legs: 2)
doesAnimalHaveClaws(tedi)

doesAnimalHaveClaws(ena)

let myRectangle = Rectangle(width: 50, height: 100)

var myOtherRect = myRectangle
myOtherRect.width = 70
myRectangle.width

myRectangle.getArea()

struct Door {
    var width: Int
    var height: Int
    var x: Int
    var y: Int
}

class House {
    var door: Door
    var hasLegs: Bool
    init(door: Door) {
        self.door = Door(width: 50, height: 50, x: 100, y: 200)
        self.hasLegs = true
    }
}






