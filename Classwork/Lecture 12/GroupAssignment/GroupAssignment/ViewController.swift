//
//  ViewController.swift
//  GroupAssignment
//
//  Created by Rob Wyant on 2/4/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.redColor()
        
        var userName = UITextField(frame:CGRect(x: 20, y: 50, width: self.view.frame.width - 40, height: 30))
            userName.placeholder = " Please enter user name"
            userName.backgroundColor = UIColor.whiteColor()
        userName.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        self.view.addSubview(userName)
        
        var password = UITextField(frame:CGRect(x: 20, y: 110, width: self.view.frame.width - 40, height: 30))
            password.placeholder = " Please enter password"
            password.backgroundColor = UIColor.whiteColor()
        password.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        self.view.addSubview(password)
        
        var loginButton = UIButton(frame:CGRect(x: 20, y: 170, width: self.view.frame.width - 40, height: 30))
        loginButton.setTitle("Login",forState: .Normal)
        loginButton.backgroundColor = UIColor.blueColor()
        loginButton.addTarget(self, action: "pressedButton:", forControlEvents: .TouchUpInside)
        loginButton.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        self.view.addSubview(loginButton)
        
        var greenBox = UIView(frame:CGRect(x: 0, y: 0, width: self.view.frame.width - 40, height: 150))
        greenBox.backgroundColor = UIColor.greenColor()
        var purpleBox = UIView(frame:CGRect(x: 0, y: 150, width: self.view.frame.width - 40, height: 150))
        purpleBox.backgroundColor = UIColor.purpleColor()
        var orangeBox = UIView(frame:CGRect(x: 0, y: 300, width: self.view.frame.width - 40, height: 150))
        orangeBox.backgroundColor = UIColor.orangeColor()
        var yellowBox = UIView(frame:CGRect(x: 0, y: 450, width: self.view.frame.width - 40, height: 150))
        yellowBox.backgroundColor = UIColor.yellowColor()
        
        var boxScrollView = UIScrollView(frame:CGRect(x: 20, y: 230, width: self.view.frame.width - 40, height: 300))
        boxScrollView.backgroundColor = UIColor.grayColor()
        boxScrollView.contentSize = CGSize(width: 200, height: 600)
        self.view.addSubview(boxScrollView)
        
        boxScrollView.addSubview(greenBox)
        boxScrollView.addSubview(purpleBox)
        boxScrollView.addSubview(orangeBox)
        boxScrollView.addSubview(yellowBox)
    }

    func pressedButton (sender:UIButton) {
        println("user logged in")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

