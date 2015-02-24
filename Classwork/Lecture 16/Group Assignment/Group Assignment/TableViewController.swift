//
//  TableViewController.swift
//  Group Assignment
//
//  Created by Rob Wyant on 2/23/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, LabelInfo {
    
    var athleteNamesAsArrayOfStrings:[String] = []
    var coachesArray:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var athletes = NSUserDefaults.standardUserDefaults().objectForKey("athleteNames") as NSArray as Array
        athleteNamesAsArrayOfStrings = athletes as [String]
        
        var coachesPath = NSBundle.mainBundle().pathForResource("Coaches", ofType: "plist")
        
        var coaches = NSMutableArray(contentsOfFile: coachesPath!)
        self.coachesArray = coaches!
        
        coaches!.writeToFile(coachesPath!, atomically: true)
        println(coaches!)
        
        //        var secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("SecondVC") as AddItemToTableViewViewController
        //        secondVC.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func setLabelText(textInfo:String) {
        self.athleteNamesAsArrayOfStrings.append(textInfo)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.athleteNamesAsArrayOfStrings.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")

        // Configure the cell...
        cell.textLabel?.text = self.athleteNamesAsArrayOfStrings[indexPath.row]
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
