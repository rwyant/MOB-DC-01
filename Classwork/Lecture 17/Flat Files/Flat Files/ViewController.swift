//
//  ViewController.swift
//  Flat Files
//
//  Created by Rob Wyant on 3/2/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func viewData(sender: UIButton) {
        var txtPath = NSTemporaryDirectory() + "hello.txt"
        var stringToLoad: NSString? = NSString(contentsOfFile: txtPath, encoding: NSUTF32StringEncoding, error: nil)
        self.textView.text = stringToLoad!
    }
    
    @IBAction func loadData(sender: UIButton) {
        
        var txtPath = NSTemporaryDirectory() + "hello.txt"
        var stringToLoad: NSString? = NSString(contentsOfFile: txtPath, encoding: NSUTF32StringEncoding, error: nil)
//
        
        
//        let fileManager = NSFileManager()
//        let path = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentationDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]
//        
//        if path.count > 0 {
//            let documentsPath = path[0].relativePath! as String
//            let mySavedPath = documentsPath + "/savedFile.txt"
//            
//            var stringToLoad: NSString? = NSString(contentsOfFile: mySavedPath, encoding: NSUTF32StringEncoding, error: nil)
//            
            if let loadedContent = stringToLoad {
                println("Content Loaded! Content is: \(loadedContent)")
            } else {
                println("Could not load data")
            }
//        } else {
//            println("Could not save")
//        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var tempPath = NSTemporaryDirectory() + "hello.txt"
        println(tempPath)
        var stringToSave = "Hello World!"
        stringToSave.writeToFile(tempPath, atomically: true, encoding: NSUTF32StringEncoding, error: nil)
        // Do any additional setup after loading the view, typically from a nib.
        
        var fileManager = NSFileManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

