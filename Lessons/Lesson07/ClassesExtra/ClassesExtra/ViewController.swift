//
//  ViewController.swift
//  ClassesExtra
//
//  Created by Thomas Degry on 14/01/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Create two users just for demonstration purposes
        let user1 = User(name: "Tedi", age: 28, admin: true)
        let user2 = User(name: "Thomas", age: 22, admin: false)
    }

}

