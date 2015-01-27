//
//  ViewController.swift
//  Tables and Segues
//
//  Created by Rob Wyant on 1/26/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var swipeView: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initiateRightSwipeOnRedBox()
        initiateDoubleTapOnRedBox()
    }

    func initiateDoubleTapOnRedBox(){
        let doubleTap = UITapGestureRecognizer(target:self,action:"doubleTapped:")
        doubleTap.numberOfTapsRequired = 2
        self.swipeView.addGestureRecognizer(doubleTap)
    }
    
    func doubleTapped (sender:UITapGestureRecognizer) {
//        UIView.animateWithDuration(1.0,animations: {
//            self.swipeView.backgroundColor = UIColor.blueColor()
//            })
//        self.resultsLabel.text = "You double tapped"
        var thirdVC = self.storyboard?.instantiateViewControllerWithIdentifier("ThirdVC") as ThirdViewController
        
        self.presentViewController(thirdVC,animated:true,completion:nil)
    }
    
    func initiateRightSwipeOnRedBox(){
        let swipeRight = UISwipeGestureRecognizer(target:self,action:"swipedRight:")
        swipeRight.numberOfTouchesRequired = 2
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        
        self.swipeView.addGestureRecognizer(swipeRight)
    }
    
    func swipedRight (sender:UISwipeGestureRecognizer) {
        self.performSegueWithIdentifier("showSecondVC", sender: self)
//        self.resultsLabel.text = "You swiped right"
//        UIView.animateWithDuration(1.0, animations: {
//            self.swipeView.backgroundColor = UIColor.redColor()
//        })
//        var secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("SecondVC") as SecondViewController
//        self.presentViewController(secondVC,animated:true,completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

