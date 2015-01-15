//
//  FibonacciAdder.swift
//  Lesson02
//
//  Created by Rob Wyant on 1/15/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class FibonacciAdder {
    
    /*
    TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.*/
    func fibonacciNumberAtIndex(indexOfFibonacciNumber:Int)-> Int {
        var fibNum = indexOfFibonacciNumber, current = 0, next = 1, result = 0
        for index in 0..<fibNum {
            let tempVar = current
            current = next
            next = tempVar + current
            result = tempVar
        }
        
        return result

        
    }
    
}