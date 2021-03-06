//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    @IBOutlet weak var fibNumText: UITextField!
    @IBOutlet weak var fibLabel: UILabel!

    
    /*
    TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.*/
    
    @IBAction func fibButton(sender: AnyObject) {
        // ****** One error here which is important to check for when calling toInt() (won't count this against you, just keep in mind for future reference). If user enters anything but a number in the text field the app crashes because you are unwrapping the optional without checking if it has a value or if it's nil. This is a great place to conditionall unwrap the age optional.
        var fibNumb:Int = fibNumText.text.toInt()!
        var myFibClass = FibonacciAdder()
        var result = myFibClass.fibonacciNumberAtIndex(fibNumb)
        fibLabel.text = String(result)
        println("TODO Seven: Success")
    }
    
    
    
    
}
