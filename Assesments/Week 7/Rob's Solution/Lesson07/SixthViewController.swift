
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var txtPath = NSTemporaryDirectory() + "spaceDelimitedFile.txt"
        var stringToLoad: NSString? = NSString(contentsOfFile: txtPath, encoding: NSUTF32StringEncoding, error: nil)
        var spaceDelimitedArray = stringToLoad?.componentsSeparatedByString(" ")
        textView.text = "\(spaceDelimitedArray!)"

    }
}
