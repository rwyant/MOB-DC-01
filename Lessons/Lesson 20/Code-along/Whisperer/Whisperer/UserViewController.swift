//
//  UserViewController.swift
//  Whisperer
//
//  Created by Tedi Konda on 3/11/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var feedback: UILabel!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var currentUser = PFUser.currentUser()
        
        if currentUser != nil {
            println("You are logged in!")
            println(currentUser)
        }else {
            println("Not logged in!")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(self.username.text, password: self.password.text) { (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                self.feedback.text = "Successfully logged in!"
            }else {
                self.feedback.text = "Error logging in!"
            }
        }
    }
    
    @IBAction func register(sender: AnyObject) {
        var user = PFUser()
        user.username = self.username.text
        user.password = self.password.text
        user.email = self.username.text
        
        user.signUpInBackgroundWithBlock { (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                self.feedback.text = "Successfully signed up!"
                self.username.text = ""
                self.password.text = ""
            }else {
                let userError = error.userInfo!["error"] as? NSString
                self.feedback.text = userError
            }
        }
    }
    

}
