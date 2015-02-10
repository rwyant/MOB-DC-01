//
//  ViewController.swift
//  faceScene
//
//  Created by Rob Wyant on 2/9/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var mouthView: UIView!
    
    @IBAction func userSlectedView(sender: UITapGestureRecognizer) {
        self.mouthView.backgroundColor = self.mouthView.backgroundColor == UIColor.redColor() ? UIColor.greenColor() : UIColor.redColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

