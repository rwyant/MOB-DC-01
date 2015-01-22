//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var outLabel: UILabel!
    
    @IBAction func calculateFibonacci(sender: AnyObject) {
        if let val = numTextField.text.toInt() {
            var fibAdder = FibonacciAdder()
            outLabel.text = "Fibonacci number \(val) is \(fibAdder.fibonacciNumberAtIndex(val))"
        }
        else {
            outLabel.text = "That's not even a number"
        }
    }
    
/*
    TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.
*/
}
