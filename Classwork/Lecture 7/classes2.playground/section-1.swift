// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Vehicle {
    var wheels = 0
    var name:String = ""
    var color:String = ""
    var numOfSeats = 0
    var numOfAxels = 0

    func go() {
        println("Vroom vroom")
    }
    
    func inspectCar() {
        println("This car has \(self.numOfSeats) seats and \(self.numOfAxels) axels.")
    }

    class func aboutVehicles() {
        println("Cars are awesome")
    }

    
}
var myCar = Vehicle()
myCar.wheels = 4
myCar.name = "Car"
myCar.color = "Green"
myCar.numOfSeats = 4
myCar.numOfAxels = 2

myCar.inspectCar()
Vehicle.aboutVehicles()





