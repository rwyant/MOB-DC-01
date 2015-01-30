// Playground - noun: a place where people can play

import UIKit

var myArray = [1, 4, 10, 15, 20]

var secondArray: [Int] = []

var stringArray: [String] = []

myArray[2]

myArray[myArray.count - 1]

myArray.first
myArray.last!

secondArray.append(20)

secondArray.first

secondArray[0]

secondArray.append(100)
secondArray.append(4)

myArray.insert(100, atIndex:2)

myArray[2]

myArray.insert(50, atIndex:myArray.count - 1)
myArray.isEmpty
stringArray.isEmpty

myArray.removeAtIndex(2)
myArray

myArray + secondArray

for i in myArray {
    println(i)
}

for i in myArray {
    if i == 10 {
        println("Bingo")
    } else {
        println("The value is \(i)")
    }
}

