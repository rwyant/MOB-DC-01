//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var outLabel: UILabel!
    
    @IBAction func performEvenTest(sender: AnyObject) {
        if let val = numTextField.text.toInt() {
            if isEven(val) {
                outLabel.text = "is even"
            }
            else {
                outLabel.text = "is not even"
            }
        }
        else {
            outLabel.text = "That's not a number.  Be serious"
        }
    }
    
    
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
}
