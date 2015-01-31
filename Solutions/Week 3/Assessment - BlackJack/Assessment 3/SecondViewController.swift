//
//  SecondViewController.swift
//  Assessment 3
//
//  Created by Tedi Konda on 1/23/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var gameRules: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameRules.text = "1. Tap twice on green box to get dealt another card. \n2. Swipe right to stop dealing cards and compare your score to CPU's \n3. If your score goes above 21, you lose."
    }


    @IBAction func dismissRules(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
