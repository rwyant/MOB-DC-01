//
//  ViewController.swift
//  spring animation
//
//  Created by Thomas Degry on 15/02/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isSmall = true
    @IBOutlet var square: UIView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func animate(sender: AnyObject) {
        if self.isSmall {
            self.widthConstraint.constant = 100
            self.isSmall = false
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.square.layoutIfNeeded()
            })
        } else {
            self.widthConstraint.constant = 60
            self.isSmall = true
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.square.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func animateCool(sender: AnyObject) {
        if self.isSmall {
            self.widthConstraint.constant = 100
            self.isSmall = false
            UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.square.layoutIfNeeded()
            }, completion: nil)
        } else {
            self.widthConstraint.constant = 60
            self.isSmall = true
            UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.square.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

