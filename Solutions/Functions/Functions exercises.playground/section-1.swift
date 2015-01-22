// Playground - noun: a place where people can play
// Lesson 05

// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

// TODO: Write a function that prints out "Hello world!" 10 times
func helloWorld() {
    for index in 1...10 {
        println("Hello world!")
    }
}

//// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times
//func knockMultipleTimes(ammountOfTimes:Int) {
//    for index in 1...ammountOfTimes {
//        knockknock()
//    }
//}

// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"
func sayHello(name:String) {
    println("Hello \(name)")
}

// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"
func sayHelloOptional(name:String?) {
    if let actualName = name {
        println("Hello \(name)")
    } else {
        println("Hello world")
    }
}

// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci
// sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.
func fibonacci(place:Int) -> Int {
    var fibNum = place, current = 0, next = 1, result = 0
    for index in 0..<fibNum {
        let tempVar = current
        
        current = next
        next = tempVar + current
        result = tempVar
    }
    
    return result
}

// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.
func firstTwentyFibNumbers() {
    var sum = 0
    for index in 0..<20 {
        sum += fibonacci(index)
    }
    
    println(sum)
}

firstTwentyFibNumbers()

func isPrime(value: Int) -> String {
    // 2 and 3 are kind of exceptions on the global rule
    // So we check for those first, if value is less or equal to three we go into this if
    // If the value is equal or bigger than two it's returning true
    // Note if so, the execution of this func stops here!
    if(value < 1) {
        return "either"
    }
    
    if value <= 3 && value > 1 {
        if(value > 2) {
            return "prime"
        }
    }
    
    // The difinition of a prime is that you can only devide it by one and itself
    // So if the remainder after a division between two or three is zero, it's not a prime
    println("value % 2 = \(value % 2), value % 3 = \(value % 3)")
    if value % 2 == 0 || value % 3 == 0 {
        return "composite"
    }
    
    // And then there are all the other numbers you can divide to
    // Primes are always a multiple of 6 plus or minus one
    // Example: 5 (6 * 1 - 1), 7 (6 * 1 + 1), 11 (6 * 2 - 1), 13 (6 * 2 + 1), 17 (6 * 3 - 1)
    // We know the next prime after 2 and 3 is 5, so we'll start with i = 5
    
    // This is what's happening here, how the loop goes
    // So if you would want to test 2677 which is a prime it would loop until 47 * 47
    // 53 * 53 is higher than 2677 so this won't be run
    /*
    5 * 5	= 25
    11 * 11	= 121
    17 * 17	= 289
    23 * 23	= 529
    29 * 29	= 841
    35 * 35	= 1225
    41 * 41	= 1681
    47 * 47	= 2209
    53 * 53	= 2809
    */
    for var i = 5; i * i <= value; i += 6 {
        println(" value = \(value), i = \(i), value % i = \(value % i) -- value % (i+2) = \(value % (i+2))")
        if value % i == 0 || value % (i + 2) == 0 {
            return "composite"
        }
    }
    
    return "prime"
}

// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)
func fibPrime() {
    for index in 1...20 {
        let fib = fibonacci(index)
        let primeResult = isPrime(fib)
        println("The number \(fib) is a \(primeResult)")
    }
}

// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).
func tipCalculator(billAmmount:Float, percentage:Float) -> (total:Double, tip:Double) {
    let tip = billAmmount * percentage
    let total = billAmmount + tip
    
    return (Double(total), Double(tip))
}

// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.
func reverseStringAndAttach(startString:String) -> String {
    var reverseStr = reverseString(startString)
    
    return startString + reverseStr
}

func reverseString(word:String) -> String {
    var reverseStr = ""
    
    for character in word {
        reverseStr = String(character) + reverseStr
    }
    
    return reverseStr
}


// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.
func findStringInArray(arrStrings:[String], searchString:String) -> Bool {
    var found = false
    
    for var i = 0; i < arrStrings.count; i++ {
        if(arrStrings[i] == searchString) {
            found = true
        }
    }
    
    return found
}

// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).
func isPalindrom(word:String) -> Bool {
    if(word == reverseString(word)) {
        return true
    }
    
    return false
}

// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings

// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.