//
//  ViewController.swift
//  Interface Builder Coding Demo
//
//  Created by Rob Wyant on 1/12/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func changeLabel(sender: AnyObject) {
        nameLabel.text = nameTextField.text
    }
    
    @IBAction func changeLabelOnDrag(sender: UISlider) {
    let sliderValue = Int(sender.value)
        nameLabel.text = "\(sliderValue)"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("Testing loaded view")
    }



}

