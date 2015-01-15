//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var numText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    
    @IBAction func calculateButton(sender: AnyObject) {
        var num = numText.text.toInt()!
        var result = ""
        func calc() -> String {
            if (num % 2) == 0 {
                result = "is even"
            } else {
                result = "is not even"
            }
            return result
        }
        resultLabel.text = calc()
        
    }
    
    
    
}
