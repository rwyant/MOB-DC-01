//
//  LoginViewController.swift
//  Sw-eets
//
//  Created by Rob Wyant on 3/11/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBAction func loginButton(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(self.usernameText.text, password:self.passwordText.text) { (user:PFUser!, error:NSError!) -> Void in
            if user != nil {
                self.feedbackLabel.text = "Successfully logged in"
                self.moveViewControllers()
            } else {
                self.feedbackLabel.text = "Error logging in."
                println(error.description)
            }
        }
    }
    
    @IBAction func registerButton(sender: AnyObject) {
        var user = PFUser()
        user.username = self.usernameText.text
        user.password = self.passwordText.text
        user.email = self.usernameText.text
        user.signUpInBackgroundWithBlock { (succeded: Bool!, error:NSError!) -> Void in
            if error == nil {
                self.feedbackLabel.text = "Successfully signed up!"
                self.usernameText.text = ""
                self.passwordText.text = ""
            } else {
                let errorString = error.userInfo!["error"] as NSString
                self.feedbackLabel.text = errorString
            }
        }
    }
    
    func moveViewControllers() {
        var modalVC = self.storyboard?.instantiateViewControllerWithIdentifier("ModalVC") as ViewController
        self.presentViewController(modalVC, animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
//        var currentUser = PFUser.currentUser()
//        if currentUser != nil {
//            println("You are logged in \(currentUser)")
//            self.moveViewControllers()
//        } else {
//            println("not logged in")
//        }
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidAppear(animated: Bool) {
//        var currentUser = PFUser.currentUser()
//        if currentUser != nil {
//            println("You are logged in \(currentUser)")
//            self.moveViewControllers()
//        } else {
//            println("not logged in")
//        }
//
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
