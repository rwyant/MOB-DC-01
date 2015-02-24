//
//  AddItemToTableViewViewController.swift
//  Group Assignment
//
//  Created by Rob Wyant on 2/23/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit


protocol LabelInfo {
    func setLabelText(textInfo:String)
}


class AddItemToTableViewViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var textLabel: UITextField!

    var delegate: LabelInfo?
    
    @IBAction func addItemButton(sender: UIButton) {
        if textLabel.text == "" {
            displayAlert(title: "Please Enter Value", message: "Please enter a value in the text box. Thank you.", buttonText: "You're welcome")
        } else {
            self.delegate?.setLabelText(textLabel.text)
            displayAlert(title: "Name Stored", message: "Your name was stored to the app. You can go back to the Table View now.", buttonText: "Okay")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlert(#title: String, message: String, buttonText: String) {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle(buttonText)
        alert.show()
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
