// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Lesson 04 playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.
var name="Rob"
var age=28
//age = 19

// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"
println("Hello \(name), you are \(age) years old!")


// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”

if age>21 {
    println("You can drink")
} else if age>18 {
    println("You can vote")
} else if age>16 {
    println("You can drive")
}else {
    println("You are too young")
}



// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.

if age < 16 {
    println("You are too young")
} else if age < 18 {
    println("You can drive")
} else if age < 21 {
    println("You can drive and vote")
} else {
    println("You can drive, vote and drink (but not at the same time)!")
}

// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)


for multiples in 1...50 {
    println(-1 + multiples*7)
}

//--or--

//var x = 7
//var y = 6
//
//for i in 1...49 {
//    println(y)
//    y = y + x
//}
//println(y)



// TODO: Create a constant called number
let number = 4
println(number)

// TODO: Print whether the above number is even
if (number % 2) == 1 {
    println("The number is odd")
} else {
    println("The number is even")
}

// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below
var one = 0
var two = 1
var three = one + two

for index in 1...35 {
    one = two
    two = three
    three = one + two
}
println(three)

//--OR---

var fibNum = 9, current = 0, next = 1, result = 0
for index2 in 0...fibNum {
    
}


// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()
println("Hello \(name), your name is \(countElements(name)) characters long!")

// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.

var r = random()
var d = 0

for rdw in 1...100 {
    d += r
}

//--OR--

//var sum1 = 0
//for i in 1...100 {
//    sum1 += Int(rand())
//}
//println(sum1)

// Bonus TO DO: Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.
var rdw = 0
while rdw < 100 {
    if (rdw % 3 == 0) && (rdw % 5 == 0) {
        println("FizzBuzz")
    } else if (rdw % 3 == 0) {
        println("Fizz")
    } else if (rdw % 5 == 0) {
        println("Buzz")
    } else {
        println(rdw)
    }
    ++rdw
}



//----OR-----
//
//let fizz = 3
//let buzz = 5
//
//for var i = 1; i <= 100; ++i {
//    if (i % fizz == 0 && i % buzz == 0) {
//        println("FizzBuzz")
//    } else if (i % fizz == 0) {
//        println("Fizz")
//    } else if (i % buzz == 0) {
//        println("Buzz")
//    } else {
//        println("Number \(i)")
//    }
//}
//


