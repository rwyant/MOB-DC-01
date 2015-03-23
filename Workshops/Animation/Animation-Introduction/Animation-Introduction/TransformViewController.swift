//
//  TransformViewController.swift
//  Animation-Intro
//
//  Created by LOANER on 3/15/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class TransformViewController: UIViewController {
    var foo:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the UIView
        self.foo = UIView(frame: CGRectMake(110, 120, 150, 150))
        self.foo?.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.foo!)
    }
    
    @IBAction func rotate(sender: UIBarButtonItem) {
        let transform = CGAffineTransformMakeRotation(CGFloat(randomDegree()))
        self.foo?.transform = transform

    }

    @IBAction func scale(sender: UIBarButtonItem) {
        let transform = CGAffineTransformMakeScale(randomScale(), randomScale())
        self.foo?.transform = transform
    }
    
    @IBAction func combination(sender: UIBarButtonItem) {
        var transform:CGAffineTransform = CGAffineTransformIdentity
        transform = CGAffineTransformScale(transform, randomScale(), randomScale())
        transform = CGAffineTransformRotate(transform, CGFloat(randomDegree()))
        self.foo?.transform = transform
    }
    
    func randomScale() -> CGFloat {
        var random = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return random * 3.0
    }
    
    func randomDegree() -> Double {
        var random = Double(arc4random() % 360)
        return random * M_PI / 180.0
    }

}
