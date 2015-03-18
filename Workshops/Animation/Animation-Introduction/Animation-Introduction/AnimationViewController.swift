//
//  AnimationViewController.swift
//  Animation-Intro
//
//  Created by LOANER on 3/16/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    var foo:CAShapeLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the UIView
        
        self.foo = CAShapeLayer()
        self.foo?.path = UIBezierPath(ovalInRect: CGRectMake(110, 100, 150, 150)).CGPath
        self.foo?.fillColor = UIColor.redColor().CGColor
        self.view.layer.addSublayer(self.foo)
    }
    
    @IBAction func coreAnimation(sender: UIBarButtonItem) {
        /*

        ANIMATION
        
        Cool, let's dive right in
        The Most straightforward animation is a CABasic Animation
        As probably is already obvious, we are in a world where layers rock
        All Core Animations happen on Layer objects
        
        CABasicAnimation is a subclass of CAAnimation
        You'll most of the time with CABasicAnimation and CAKeyframeAnimations
        
        When we create a CABsicAnimation we have to specify a keypath
        To get an idea of what is all possible, take a look here:
        https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/Key-ValueCodingExtensions/Key-ValueCodingExtensions.html#//apple_ref/doc/uid/TP40004514-CH12-SW8
        
        Second and third we have to set a toValue and a duration
        Go ahead and add the animation to the layer
        
        Strange, it jumps back, let's explain why
        
        */
        
        let position = CABasicAnimation(keyPath: "position.y")
        position.toValue = 300
        position.duration = 0.5
        self.foo?.addAnimation(position, forKey: "foo.movedown")
        self.foo?.position = CGPointMake(0, 300)
    }
    
    @IBAction func facebookPop(sender: UIBarButtonItem) {
        
    }
    
}
