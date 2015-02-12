//
//  ViewController.swift
//  progromatic autolayout
//
//  Created by Rob Wyant on 2/11/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var head: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        self.head.layer.cornerRadius = 100
        self.head.clipsToBounds = true
        
        var body = UIView()
        body.backgroundColor = UIColor.greenColor()
        self.view.addSubview(body)
        

        
        body.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //Constraints for the body
        let bodyWidth = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Width,
            multiplier: 0.5,
            constant: 0.0)
        
        let bodyVerticalPosition = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0.0)
        
        let bodyHorizontalPosition = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: self.head.frame.width/4)
        
        body.layer.cornerRadius = 05
        body.clipsToBounds = true
        
        
        var leftArm = UIView()
        leftArm.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(leftArm)
        
        leftArm.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //Constraints for the body
        let armWidth = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 20)
        
        let armVerticalPosition = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: -5.0)
        
        let armHorizontalPosition = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        let armHeight = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 60)
        
        self.view.addConstraints([armHeight,armVerticalPosition,armHorizontalPosition,armWidth])

        var rightArm = UIView()
        rightArm.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(rightArm)
        
        rightArm.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //Constraints for the body
        let rightArmWidth = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: -20.0)
        
        let rightArmVerticalPosition = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: 5.0)
        
        let rightArmHorizontalPosition = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        let rightArmHeight = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 60)
        
        self.view.addConstraints([rightArmHeight,rightArmVerticalPosition,rightArmHorizontalPosition,rightArmWidth])

        leftArm.layer.cornerRadius = 20
        leftArm.clipsToBounds = true
        rightArm.layer.cornerRadius = 20
        rightArm.clipsToBounds = true
        
        var leftLeg = UIView()
        leftLeg.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(leftLeg)
        
        leftLeg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //Constraints for the body
        let leftLegWidth = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 80.0)
        
        let leftLegVerticalPosition = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 0.0)
        
        let leftLegHorizontalPosition = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: -70)
        
        let leftLegArmHeight = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 160)
        
        self.view.addConstraints([leftLegArmHeight,leftLegHorizontalPosition,leftLegVerticalPosition,leftLegWidth])
        
//        leftLeg.constraint.priority
        
        
        var rightLeg = UIView()
        rightLeg.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(rightLeg)
        
        rightLeg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //Constraints for the body
        let rightLegWidth = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: -80.0)
        
        let rightLegVerticalPosition = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: 0.0)
        
        let rightLegHorizontalPosition = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: -70)
        
        let rightLegArmHeight = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 160)
        
        self.view.addConstraints([rightLegArmHeight,rightLegHorizontalPosition,rightLegVerticalPosition,rightLegWidth])
        
        var bodyVerticalPosition2 = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: rightLeg,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 05.0)
        
        self.view.addConstraints([bodyWidth,bodyVerticalPosition,bodyHorizontalPosition,bodyVerticalPosition2])
        
        leftLeg.layer.cornerRadius = 10
        leftLeg.clipsToBounds = true
        rightLeg.layer.cornerRadius = 10
        rightLeg.clipsToBounds = true
        

        var bow = UIView()
        bow.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(bow)

        bow.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let bowWidth = NSLayoutConstraint(
            item: bow,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: body.frame.width/2)
        
        let bowVerticalPosition = NSLayoutConstraint(
            item: bow,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: body.frame.width/4)
        
        let bowHorizontalPosition = NSLayoutConstraint(
            item: bow,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        let bowHeight = NSLayoutConstraint(
            item: bow,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftArm,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: leftArm.frame.height/2)
        
        self.view.addConstraints([bowHeight,bowHorizontalPosition,bowVerticalPosition,bowWidth])
        
        bow.layer.cornerRadius = 75
        bow.clipsToBounds = true
        
        var tie = UIView()
        tie.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(tie)
        
        tie.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //Constraints for the body
        let tieWidth = NSLayoutConstraint(
            item: tie,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Width,
            multiplier: 0.5,
            constant: 0)
        
        let tieVerticalPosition = NSLayoutConstraint(
            item: tie,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0.0)
        
        let tieHorizontalPosition = NSLayoutConstraint(
            item: tie,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 18)
        
        let tieVerticalPosition2 = NSLayoutConstraint(
            item: tie,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: rightLeg,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 05.0)
        
        self.view.addConstraints([tieWidth,tieVerticalPosition,tieHorizontalPosition,tieVerticalPosition2])
        
        tie.layer.cornerRadius = 100
        tie.clipsToBounds = true
        


        
//        var leftBow = CAShapeLayer()
//        leftBow.frame = self.bounds
        

}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

