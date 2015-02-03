//
//  AddEventViewController.swift
//  Delegation
//
//  Created by Thomas Degry on 28/01/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

protocol EventProtocol {
    func saveEvent(newEvent:Event)
}

class AddEventViewController: UIViewController {
    // Create an instance of the delegate
    var delegate:EventProtocol?

    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var locationLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add Cancel button on the left and save button on the right
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "dismiss")
        let saveButton = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self, action: "save")

        // set navigation items
        self.navigationItem.title = "Add Event"
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    func save() {
        // create new event from struct
        let newEvent = Event(name: nameLabel.text, location: locationLabel.text)
        
        // send delgate message
        self.delegate?.saveEvent(newEvent)
        
        // use existing dismiss function to dismiss our view
        dismiss()
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
