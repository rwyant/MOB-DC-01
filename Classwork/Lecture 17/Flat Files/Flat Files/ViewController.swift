//
//  ViewController.swift
//  Flat Files
//
//  Created by Rob Wyant on 3/2/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var tempPath = NSTemporaryDirectory() + "hello.txt"
        var stringToSave = "Hello World!"
        stringToSave.writeToFile(tempPath, atomically: true, encoding: NSUTF32StringEncoding)
        // Do any additional setup after loading the view, typically from a nib.
        
        var fileManager = NSFileManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

