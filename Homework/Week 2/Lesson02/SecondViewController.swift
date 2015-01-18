//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var numText: UITextField!
    @IBOutlet weak var sumLabel: UILabel!
    var sum = 0

    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
    @IBAction func addButton(sender: AnyObject) {
        var num = numText.text.toInt()!
        func sumOfNumb() -> String {
        sum += num
            println("TODO Five: Success")
        return String(sum)
        }
        
        sumLabel.text = sumOfNumb()
    }

    



}



