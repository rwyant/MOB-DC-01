//
//  MapViewController.swift
//  Delegation & Notifications
//
//  Created by Rob Wyant on 2/7/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var textToAddToDictionaryKey: UITextField!
    @IBOutlet weak var textToAddToDictionaryValue: UITextField!
    @IBOutlet weak var tableViewToDisplayDictionary: UITableView!
    
    var dictionaryOfStrings: [String: String] = ["Swift":"Capable of moving with great speed.","Storyboard":"Sketches that depict actions."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textToAddToDictionaryKey.delegate = self
        self.textToAddToDictionaryValue.delegate = self
        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyboardWillShow:", name:UIKeyboardWillShowNotification, object:nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyboardWillHide:", name:UIKeyboardWillHideNotification, object:nil)
    }

    func keyboardWillHide(notification:NSNotification){
        textToAddToDictionaryKey.backgroundColor = UIColor.redColor()
        textToAddToDictionaryValue.backgroundColor = UIColor.redColor()
    }

    func keyboardWillShow(notification:NSNotification){
        textToAddToDictionaryKey.backgroundColor = UIColor.blueColor()
        textToAddToDictionaryValue.backgroundColor = UIColor.blueColor()
    }
    
    func textFieldShouldReturn(textField:UITextField!) -> Bool {
        if textField == textToAddToDictionaryKey {
            textToAddToDictionaryValue.becomeFirstResponder()
        } else {
        textField.resignFirstResponder()
        addTextToDictionaryOfStrings()
        }
        return true
    }
    
    func addTextToDictionaryOfStrings(){
        dictionaryOfStrings[textToAddToDictionaryKey.text] = textToAddToDictionaryValue.text
        textToAddToDictionaryKey.text = ""
        textToAddToDictionaryValue.text = ""
        println("\(dictionaryOfStrings)")
        self.tableViewToDisplayDictionary.reloadData()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dictionaryOfStrings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Value1, reuseIdentifier: "CellIdentifier")

        let myRowKey = [String](dictionaryOfStrings.keys)
        
        cell.textLabel?.text = myRowKey[indexPath.row]
        cell.detailTextLabel?.text = dictionaryOfStrings[myRowKey[indexPath.row]]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var myRowKey = [String](dictionaryOfStrings.keys)
        
        if editingStyle == .Delete {
            dictionaryOfStrings.removeValueForKey(myRowKey[indexPath.row])
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    /*
    TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
    TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
    TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
    */

}
