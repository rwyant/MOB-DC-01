//
//  AddViewController.swift
//  Table view demo
//
//  Created by Tedi Konda on 1/28/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

// Protocol for delegation method needs to be added at the top of the class that's sending the data
protocol Campus {
    func addCampusToArray(campusName: String)
}

// Adding the UITextFieldDelegate so we get the convenience methods for our text fields
class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addTextBox: UITextField!
    
    @IBOutlet weak var hiddenLabel: UILabel!
    var delegate: Campus?
    
    @IBOutlet weak var errorMessage: UILabel!
    @IBAction func saveAndGoBack(sender: AnyObject) {
        self.delegate?.addCampusToArray(addTextBox.text)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func pressPostButton(sender: AnyObject) {
        // First step in setting notfication
        NSNotificationCenter.defaultCenter().postNotificationName("unhideHiddenLabels", object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Second step after adding the UITextFieldDelegate protocol to our class is to assign the delegate for the text field
        self.addTextBox.delegate = self
        
        // Hidden is a property that's available for all of our views/objects
        self.errorMessage.hidden = true
        self.hiddenLabel.hidden = true
        
        // Do any additional setup after loading the view.
        // Selector is the method that we run after a notification has been posted
        // Name is the name of the notificaion we are listening for
        // BEST PRACTICE: you will almost always add notification observers in your viewDidLoad
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "unhideCurrentLabels:",
            name: "unhideHiddenLabels",
            object: nil)
        
        // This is a notification that we get from iOS libraries, therefore we do not need to post the notification from anywhere. This gets triggered whenever a text field gets updated
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "textHasChanged:",
            name: UITextFieldTextDidChangeNotification,
            object: nil)
    }
    
    // Remember to pass NSNotification as a paremeter in the methods that execute after a notification is posted
    func textHasChanged(notification: NSNotification) {
        println("Hooray, text has changed!")
    }
    
    func unhideCurrentLabels(notification: NSNotification) {
        self.hiddenLabel.hidden = false
        println("Triggered unhideHiddenLabels notfication")
    }
    
    // This function gets run from our UITextFieldDelegate whenever we press return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // resignFirstResponder is the method we run to hide/remove the keyboard
        textField.resignFirstResponder()
        if self.addTextBox.text.isEmpty {
            println("Your text field is empty, enter something!")
            self.errorMessage.hidden = false
        }else {
            self.errorMessage.hidden = true
        }
        return true
    }

}
