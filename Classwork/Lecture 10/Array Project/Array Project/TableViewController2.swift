//
//  TableViewController.swift
//  Array Project
//
//  Created by Rob Wyant on 1/28/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class TableViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource, LabelInfo {
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    @IBAction func addToListButton(sender: UIBarButtonItem) {
        var secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("secondVC") as ViewController
        secondVC.delegate = self
        self.presentViewController(secondVC, animated: true, completion: nil)
    }
    
    var toDoList: [String] = ["Learn swift", "Do Laundry", "Eat", "Study", "Practice"]
    
    func setLabelText(textInfo:String) {
        self.toDoList.append(textInfo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        // Sets each cell to equal each item in the array
//                if indexPath.row % 2 == 1 {
                    cell.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
//                } 
        cell.textLabel?.text = self.toDoList[indexPath.row]
        return cell
    }
    
    func getRandomNumber() -> Double {
        var randNum:Double = Double(random())
        return randNum
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.toDoList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}
