//
//  AddEventViewController.swift
//  Delegation
//
//  Created by Thomas Degry on 28/01/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

protocol EventProtocol {
    func addEvent(newEvent:Event)
}

class AddEventViewController: UIViewController {

    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var locationLabel: UITextField!
    
    var delegate:EventProtocol?
    
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
<<<<<<< HEAD
        let newEvent = Event(name:nameLabel.text, location: locationLabel.text)
=======
        let newEvent = Event(name: nameLabel.text, location: locationLabel.text)
>>>>>>> d50e9ad887a2aa4075864182e80e9a07beb02d66
        self.delegate?.addEvent(newEvent)
        dismiss()
    }
    
    func dismiss() {
<<<<<<< HEAD
        self.dismissViewControllerAnimated(true, completion:nil)
=======
        self.dismissViewControllerAnimated(true, completion: nil)
>>>>>>> d50e9ad887a2aa4075864182e80e9a07beb02d66
    }

}
