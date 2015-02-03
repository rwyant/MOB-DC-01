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

    @IBAction func addEvent(sender: UIBarButtonItem) {
        let addEventViewController = self.storyboard?.instantiateViewControllerWithIdentifier("addEventVC") as AddEventViewController
<<<<<<< HEAD
=======
        addEventViewController.delegate = self
>>>>>>> d50e9ad887a2aa4075864182e80e9a07beb02d66
        let navigationController = UINavigationController(rootViewController: addEventViewController)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
<<<<<<< HEAD
    func addEvent(newEvent:Event) {
        println("Foo")
=======
    func addEvent(newEvent: Event) {
        println("foo")
>>>>>>> d50e9ad887a2aa4075864182e80e9a07beb02d66
        self.arrEvents.append(newEvent)
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrEvents.count
    }
    
<<<<<<< HEAD
    
=======
>>>>>>> d50e9ad887a2aa4075864182e80e9a07beb02d66
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath) as UITableViewCell
    
    // Configure the cell...
<<<<<<< HEAD
        let currentEvent = self.arrEvents[indexPath.row]
        cell.textLabel?.text = currentEvent.name
        cell.detailTextLabel?.text = currentEvent.location
    
    return cell
    }
    
=======
    let currentEvent = self.arrEvents[indexPath.row]
    cell.textLabel.text = currentEvent.name
    cell.detailTextLabel?.text = currentEvent.location
    
    return cell
    }

>>>>>>> d50e9ad887a2aa4075864182e80e9a07beb02d66

}
