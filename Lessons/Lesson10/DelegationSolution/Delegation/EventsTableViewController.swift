//
//  EventsTableViewController.swift
//  Delegation
//
//  Created by Thomas Degry on 28/01/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController, EventProtocol {
    // event array
    var arrEvents:[Event] = []
    
    override func viewDidLoad() {
        // Have an edit button on the top left
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    @IBAction func showAddEventModal(sender: UIBarButtonItem) {
        // init add event view controller
        let addEventViewController = self.storyboard?.instantiateViewControllerWithIdentifier("addEventVC") as AddEventViewController
        
        // set the delegate to self
        addEventViewController.delegate = self
        
        // create a temp navigation controller and set the addEventViewController as rootViewController
        let navC = UINavigationController(rootViewController: addEventViewController)
        
        // present the navigation controller with the viewcontroller embedded
        self.presentViewController(navC, animated: true, completion: nil)
    }
    
    func saveEvent(newEvent: Event) {
        // append the incoming event to our array
        self.arrEvents.append(newEvent)
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrEvents.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath) as UITableViewCell

        // get the current event struct from the array at index
        let eventAtIndex = arrEvents[indexPath.row]
        
        // set textLabel and detailTextLabel
        cell.textLabel.text = eventAtIndex.name
        cell.detailTextLabel!.text = eventAtIndex.location

        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.arrEvents.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        // Get the item to move, remove it from it's index and store it in a let
        let itemToMove = self.arrEvents.removeAtIndex(sourceIndexPath.row)
        
        // Insert the item we just stored into the array again at the destination index
        self.arrEvents.insert(itemToMove, atIndex: destinationIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

}
