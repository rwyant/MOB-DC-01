// Playground - noun: a place where people can play

import UIKit

/***********Types (Variables & Constants) ***********/

var str = "Hello, playground"

var x = 10
var y = 4
x + y
x * y
var z = 0

z = x / y

z + y - x

/*********** Definitions ***********/

var mutible = "This can be changed!"
let immutible = "This is constant, and cannot be changed."
var inferred = "This will be set as a String by Swift. Thx @AppleDevTeam"

mutible = "See! I'm so different now... ;)"

/*********** Optionals; gives you an option (like yes/no) ***********/

var amIHere: String?
println(amIHere)
amIHere = "No"
println(amIHere!)

/*********** Controll Flow ***********/

// Conditionals
if (y == 5) {
    println("Y is EQUAL TO 5")
} else if (y != 5) {
    println("Y is NOT EQUAL TO 5")
} else {
    println("This is pretty unnecessary, but is considered 'good coding'.")
}

// Loops: for initialization; condition; increments

for var i = 0; i < 5; ++i {
    println("Code is running")
}

// Interprelation
for var o = 0; o < 5; ++o {
    println("Code is running \(o)")
}

// Increment 

for index in 1...5 {
    println(index)
}

// While 

var k = 1
while k < 10 {
    println("Counting...")
    ++k
}

println(k)


// Difference between For loop and While loop is you increment in the statement for the For loop, but you increment in the code for the While loop. While gives us flexibility, so if we want to measure something you can increment at the beggining of the code.





