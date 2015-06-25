// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var intngr = 1

if intngr > 16 && intngr < 18 {
} else if intngr > 18 || intngr > 21 {
}

for i in 1...50 {
    var multiple = 7 * i - 1
    println(multiple)
}

for var i = 1; i <= 50; ++i {
    println(7*i-1)
}

if intngr % 2 == 0 && intngr != 0 {
    println("This number is even")
} else { println("this number is odd or zero")}

var x1 = 0, x2 = 1, x3 = x1 + x2
for index in 1...35 {
    x1 = x2
    x2 = x3
    x3 = x1 + x2
}

var tempString = "10"
tempString.toInt()!
