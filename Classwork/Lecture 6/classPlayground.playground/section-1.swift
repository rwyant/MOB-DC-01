// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Defining a class requires we name the class with a capital letter
class Animal {
    //properties (variables), methods (funcitons)
    var numberOfLegs: Int
    var hasFur = true
    var noise = "AHHHH"
    init(legs:Int) {
        self.numberOfLegs = legs
    }
    func speak() {
        println(self.noise)
    }
}

var tedi = Animal(legs: 2)
tedi.hasFur = false

tedi.numberOfLegs = 2
tedi.speak()
println(tedi.numberOfLegs)

var ena = Animal(legs: 4)
ena.hasFur = true
ena.numberOfLegs = 4


