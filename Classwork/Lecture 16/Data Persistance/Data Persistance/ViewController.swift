//
//  ViewController.swift
//  Data Persistance
//
//  Created by Rob Wyant on 2/23/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("light", forKey: "theme")
        let theme = defaults.objectForKey("theme") as String
        if theme == "dark" {
            self.view.backgroundColor = UIColor.blackColor()
            self.helloLabel.textColor = UIColor.whiteColor()
        } else {
            self.view.backgroundColor = UIColor.whiteColor()
            self.helloLabel.textColor = UIColor.blackColor()
        }
        
        var booksPath = NSBundle.mainBundle().pathForResource("Books", ofType: "plist")
        
        var books = NSMutableArray(contentsOfFile: booksPath!)
        println(books!)
        books![0].setValue("Ena's World 2", forKey: "Title")
        println(books!)
        
        books!.writeToFile(booksPath!, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

