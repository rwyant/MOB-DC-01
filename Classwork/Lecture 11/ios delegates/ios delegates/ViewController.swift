//
//  ViewController.swift
//  ios delegates
//
//  Created by Rob Wyant on 2/2/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var gaCampuses: [String] = ["DC"]
    
    @IBOutlet weak var gaTextField: UITextField!
    @IBOutlet weak var campusesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if gaCampuses.isEmpty {
            println("Your table view is empty")
            campusesTable.hidden = true
        }
        gaTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func textFieldShouldReturn(textField:UITextField) -> Bool {
        println("Return key pressed")
        self.gaCampuses.append(gaTextField.text)
        println("\(gaCampuses)")
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Sets the number of cells in the table to equal the number of items in our array
        return self.gaCampuses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
//         Sets each cell to equal each item in the array
//                if indexPath.row % 2 == 1 {
//                    cell.backgroundColor = UIColor.orangeColor()
//                }
        
        cell.textLabel?.text = self.gaCampuses[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.gaCampuses.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    


}

