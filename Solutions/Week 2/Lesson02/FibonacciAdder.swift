//
//  FibonacciAdder.swift
//  Lesson02
//
//  Created by Adam Ostrich on 1/15/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class FibonacciAdder {
    
    private func nextFib(val1: Int, val2: Int, place: Int) -> Int {
        let newVal = val1 + val2
        
        if place == 1 {
            return newVal
        }
        
        return nextFib(val2, val2: newVal, place: place-1)
    }
    
    func fibonacciNumberAtIndex (indexOfFibonacciNumber: Int) -> Int {
        // Check to make sure the input makes sense
        if indexOfFibonacciNumber < 1 {
            println("You fail")
            return Int(rand())
        }
            // Already know the values for places 1 and 2
        else if indexOfFibonacciNumber == 1 {
            return 0
        }
        else if indexOfFibonacciNumber == 2 {
            return 1
        }
        
        return nextFib(0, val2: 1, place: indexOfFibonacciNumber-2)

    }
}