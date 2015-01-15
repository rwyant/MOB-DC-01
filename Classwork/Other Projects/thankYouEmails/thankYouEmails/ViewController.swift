//
//  ViewController.swift
//  thankYouEmails
//
//  Created by Rob Wyant on 1/15/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var schoolText: UITextField!
    @IBOutlet weak var bodyText: UITextView!
    @IBAction func typeButton(sender: AnyObject) {
        
    }
    @IBAction func previewButton(sender: AnyObject) {
        var genEmail = Body()
        genEmail.name = nameText.text
        genEmail.email = emailText.text
        genEmail.school = schoolText.text
        
        bodyText.text = genEmail.generateEmail()
    }
    @IBAction func sendButton(sender: AnyObject) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

