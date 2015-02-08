//
//  ViewController.swift
//  Delegation & Notifications
//
//  Created by Rob Wyant on 2/7/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var textBoxToAddToArray: UITextField!
    @IBOutlet weak var tableViewToDisplayArray: UITableView!

    var arrayOfStrings: [String] = ["C++","Java","Objective C","Python"]
    
    /*
    TODO one: Add a table view AND a text input box to this view controller, either in code or via the storyboard. Accept keyboard input from the text view when the return key is pressed. Add the string that was entered into the text view into an array of strings (stored in this class).
    TODO two: Make this class a UITableViewDelegate and UITableViewDataSource that supply the above table view with cells. These cells should correspond to the text entered into the text box. E.g. If the text "one", then "two", then "three" was entered into the text box, there should be three cells in this table view that contain those strings in order.
    
    */
    
    
    func textFieldShouldReturn(textField:UITextField!) -> Bool {
        textField.resignFirstResponder()
        addTextToArrayOfStrings()
        return true
    }
    func addTextToArrayOfStrings(){
        arrayOfStrings.append(textBoxToAddToArray.text)
        self.tableViewToDisplayArray.reloadData()
        println("\(arrayOfStrings)")
        textBoxToAddToArray.text = ""
    }
    
    func alphabetize (s1: String, s2: String) -> Bool {
        return s1 < s2
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfStrings.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        // Sets each cell to equal each item in the array
        //                if indexPath.row % 2 == 1 {
//        cell.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
        //                }
        cell.textLabel?.text = self.arrayOfStrings[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.arrayOfStrings.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textBoxToAddToArray.delegate = self
    }

}

