//
//  ThirdViewController.swift
//  Table views and scenes
//
//  Created by Tedi Konda on 1/26/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBAction func dismissModal(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
