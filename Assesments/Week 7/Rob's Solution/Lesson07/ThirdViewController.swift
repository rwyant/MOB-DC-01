//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tempPath = NSTemporaryDirectory() + "hello.txt"
        var stringToSave = textView.text
        stringToSave.writeToFile(tempPath, atomically: true, encoding: NSUTF32StringEncoding, error: nil)
        // Do any additional setup after loading the view.
    }
}
