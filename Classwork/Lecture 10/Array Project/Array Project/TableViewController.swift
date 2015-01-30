//
//  TableViewController.swift
//  Array Project
//
//  Created by Rob Wyant on 1/28/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, LabelInfo {
    
    
    var toDoList: [String] = ["Learn swift", "Do Laundry", "Eat", "Study", "Practice"]
    
    func setLabelText(textInfo:String) {
        self.toDoList.append(textInfo)
    }
    
    

    @IBAction func addToListButton(sender: UIBarButtonItem) {
        var secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddItemVC") as ViewController
        secondVC.delegate = self
        self.presentViewController(secondVC, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    /*
    6. Return the array size under the tableView that has the numberOfRowsInSection paremeter. Ex: */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Sets the number of cells in the table to equal the number of items in our array
        return self.toDoList.count
    }
    /*
    7. Update the tableView method with the cellForRowIndexPath paremeter to update all the cells with the array data. ex:
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        // Sets each cell to equal each item in the array
//        if indexPath.row % 2 == 1 {
//            cell.backgroundColor = UIColor.lightGrayColor()
//        }
        
        
        cell.textLabel?.text = self.toDoList[indexPath.row]
        return cell
    }    

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.toDoList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    
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
