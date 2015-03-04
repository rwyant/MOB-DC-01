//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    var stringText = ""
    var intText = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var stringFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey("test_string") as NSString as String
        stringText = stringFromNSUserDefaults as String

        var intFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey("test_number") as NSInteger as Int
        intText = intFromNSUserDefaults as Int
        
        textView.text = "The string from NSUserDefaults is: \(stringText) \nThe int from NSUserDefaults is: \(intText)"
    }
}