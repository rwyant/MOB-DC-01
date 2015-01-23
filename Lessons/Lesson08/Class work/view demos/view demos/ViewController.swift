//
//  ViewController.swift
//  view demos
//
//  Created by Tedi Konda on 1/21/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func swipeSquareLeft(sender: UISwipeGestureRecognizer) {
        UIView.animateWithDuration(1, animations: {
            self.mySquare.backgroundColor = UIColor.blueColor()
            self.mySquare.alpha = 1
            println("Swiped left")
        })
    }

    @IBAction func swipeSquareRight(sender: UISwipeGestureRecognizer) {
        UIView.animateWithDuration(1, animations: {
            self.mySquare.backgroundColor = UIColor.redColor()
            self.mySquare.alpha = 0.5
            println("Swiped right")
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

