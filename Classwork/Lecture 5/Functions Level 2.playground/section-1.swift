// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Playground - noun: a place where people can play

import UIKit

// Inout paremeters let us modify external variables
// The paremeter is prefixed with an inout before the paremeter declaration on the function. The paremeter passed into the function when the function is called is prefixed with a &. Warning: it is not good practice to do this usually.
// ex: func modifyVar(inout myString: String
// ex: modifyVar(&passedParemeter)
// Write a function changeName that prints out "Name changed to 'paremeter'" and that changes the value of the variable passed to it

func changeName(inout myString: String) {
    println("Name changed to \(myString)")
}
var paremeter = "Rob"
changeName(&paremeter)



// Write a function to find the sum of any two multiples below any max value (make the default 2000)
// call sould be something like this: addMultiples(mult1: 3, mult2: 5). answer should be 233,168
var confused = " doesn't understand the question"
println("\(paremeter)\(confused)")

// Change calculator: write a function that takes a dollar amount and returns the amount of pennies, nickles, dimes, and quarters needed to return as change (if under $1)
func change (dollarAmount:Float) -> String {
    var chng1:Float = dollarAmount % 1 * 100
    var chng: Int = Int(chng1)
    var quarter = 25
    var dime = 10
    var nickle = 5
    var penny = 1
    var dollar = Int(dollarAmount)/1
    var quarterCount = 0
    var dimeCount = 0
    var nickleCount = 0
    var pennyCount = 0
    
    if chng >= quarter {
        quarterCount = (chng / quarter)
        chng = chng - (quarterCount * quarter)
    } else {
        println("Skip Quarter")
        }
    if chng >= dime {
        dimeCount = (chng / dime)
        chng = chng - (dimeCount * dime)
    } else {
        println("Skip Dime")
        }
    if chng >= nickle {
        nickleCount = (chng / nickle)
        chng = chng - (nickleCount * nickle)
    } else {
        println("Skip Nickle")
        }
    if chng >= penny {
            pennyCount = (chng / penny)
            chng = chng - (pennyCount * penny)
    } else {
        println("Skip Penny")
        }


var result = ""
result = ("Dollar = \(dollar), Q = \(quarterCount), D = \(dimeCount), N = \(nickleCount), P = \(pennyCount)")
    return result
}
change(2.49)
change(12.68)
change(44.44)




// Variadic paremeters are an endless list of paremeters that can be passed inside a function. The data inside the function itself is greated as an array. Write a function that takes a paremeter describing whether to  multiply or add, and a variadic paremeter that represents all the numbers. Return either the sum or the multiplicaiton of the integerss.
// Variadic paremeters example: addNumbers(numbers: Int...)

// Closures are self contained blocks that are anonymously defined (similar to blocks in c)
// Functions are a type of named closure
// Closures can be passed around as variables
// A great use for closures is the ability to increment variables/constants. We can return a contained function that returns another value.
// ex: makeIncrements(incrementAmount: Int) -> () -> int
// Now we can do let myVal = makeIncrements(20). Everytime we run myVal() the return value will increment by the incrementAmount.
// More info on closures: http://fuckingswiftblocksyntax.com/ and https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html
// Write a function similar to the one above that gives us the option to either multiply or add, asks us for a base value, and returns a new value everytime we execute the constant/variable

// The map function is an example of a closure. Use the map function to take an array of names and change the value of each name to "name has been updated".

// Recursion happens when a funciton calls itself from within itself
// Re-write the fibonacci sequence function to use recursion






