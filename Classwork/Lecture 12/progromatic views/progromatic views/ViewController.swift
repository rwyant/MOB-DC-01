//
//  ViewController.swift
//  progromatic views
//
//  Created by Rob Wyant on 2/4/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var increment = 1
    var xValue = 1
    var yValue = 1
    var delay = 0.15
    
    var outlineBox = UIView(frame:CGRect(x: 19, y: 49, width: 0, height: 202))
    var actionButton = UIButton(frame:CGRect(x: 20, y: 300, width: 0, height: 30))
    var actionButton2 = UIButton(frame:CGRect(x: 20, y: 300, width: 0, height: 30))
    
    func pressedCodedButn(sender:UIButton) {
        self.outlineBox = UIView(frame:CGRect(x: 19, y: 49, width: self.view.frame.width - 38, height: 202))
        //        sender.removeFromSuperview()
        increment = 1
        xValue = 1
        yValue = 1
        delay = 0.15
        
        self.outlineBox.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(outlineBox)
        
        UIView.animateWithDuration(0.5, delay: 2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.outlineBox.backgroundColor = UIColor.blackColor()
        }, completion: nil)
        
        for i in 1...10 {
            var coloredBox:UIView = UIView(frame: CGRect(x: 1, y: increment, width: 0, height: 20))
            coloredBox.backgroundColor = i % 2 == 0 ? UIColor.redColor() : UIColor.blueColor()
            outlineBox.addSubview(coloredBox)
            
            UIView.animateWithDuration(0.5, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                coloredBox.frame = CGRect(x: coloredBox.frame.origin.x, y: coloredBox.frame.origin.y, width: self.outlineBox.frame.width - 2, height: 20)
                }, completion: nil)
            increment += 20
            delay += 0.15
        }
        
        var whiteBox = UIView(frame:CGRect(x: 1, y: 1, width: 0, height: 100))
        whiteBox.backgroundColor = UIColor.whiteColor()
        outlineBox.addSubview(whiteBox)
        
        UIView.animateWithDuration(0.5, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            whiteBox.frame = CGRect(x:1, y:1, width:100, height:100)
        }, completion: nil)
        
        for i in 1...10 {
            for i in 1...10{
                var starImage = UIImage(named: "star")
                var starImageImageView = UIImageView(image: starImage)
                starImageImageView.frame = CGRect(x: xValue, y: yValue, width: 0, height: 10)
                outlineBox.addSubview(starImageImageView)
                
                UIImageView.animateWithDuration(0.5, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations:{
                    starImageImageView.frame = CGRect(x: starImageImageView.frame.origin.x, y: starImageImageView.frame.origin.y, width: 10, height:10)}, completion: nil)
                xValue += 10
            }
            xValue = 1
            yValue += 10
            delay += 0.2
        }
        println("Fuck yeah.")
        
        self.actionButton2 = UIButton(frame:CGRect(x: 20, y: 300, width: self.view.frame.width - 40, height: 30))
        actionButton2.setTitle("Restart", forState:.Normal)
        actionButton2.backgroundColor = UIColor.blueColor()
        actionButton2.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        actionButton2.addTarget(self, action: "clearView:", forControlEvents: .TouchUpInside)
        self.view.addSubview(actionButton2)
        self.actionButton.removeFromSuperview()
    }
    
    func clearView(sender:UIButton) {
        println("Well, aren't you unpatriotic. 😭")
        actionButton.setTitle("'MERICA", forState:.Normal)
        actionButton.addTarget(self, action: "pressedCodedButn:", forControlEvents: .TouchUpInside)
        self.outlineBox.removeFromSuperview()
        self.actionButton2.removeFromSuperview()
        self.view.addSubview(actionButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actionButton = UIButton(frame:CGRect(x: 20, y: 300, width: self.view.frame.width - 40, height: 30))
        actionButton.setTitle("'MERICA", forState:.Normal)
        actionButton.backgroundColor = UIColor.blueColor()
        actionButton.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        actionButton.addTarget(self, action: "pressedCodedButn:", forControlEvents: .TouchUpInside)
        self.view.addSubview(actionButton)
    }
    
}

