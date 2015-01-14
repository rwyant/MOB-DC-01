// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func hello() {
    println("Hello world")
}

hello()

func sum(firstNumber: Int, secondNumber: Int) -> Int {
    let newSum = firstNumber * (secondNumber - firstNumber)
    return newSum
}

var x = sum(10, 10)
var y = sum(x, 15)


//----FIBONOCCI NUMBER----
func fib(fibNum: Int) -> Int {
    var x1 = 0, x2 = 1, x3 = x1 + x2
    for index in 3...fibNum {
        x1 = x2
        x2 = x3
        x3 = x1 + x2
    }

    return x3
}


var q = 8
fib(30)
fib(q)
var thirtySeventhNumber = fib(37)

//Random optional? tangent, **very important**
var num: Int? = 5
if let numValue = num {
    println(numValue + 5)
}


//back to functionals

func save(name: String) -> (first: String, last: String) {
    var lastName = "Wyant"
    return (name, lastName) //This is called a twopul (sp?)
}

var myName = save("Rob")
myName.first
myName.last













