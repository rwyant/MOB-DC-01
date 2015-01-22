//
//  ViewController.swift
//  Lesson 8 - View Demos
//
//  Created by Rob Wyant on 1/21/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mySquare: UIView!
    
//    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
//        UIView.animateWithDuration(duration:3, animations: mySquare.backgroundColor = UIColor.redColor()
//        )
//        
//    }
    @IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
        UIView.animateWithDuration(3, animations:  mySquare.backgroundColor = UIColor.greenColor()
        )
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

