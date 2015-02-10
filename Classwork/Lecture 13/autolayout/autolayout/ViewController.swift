//
//  ViewController.swift
//  autolayout
//
//  Created by Rob Wyant on 2/9/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var verticalSpacingBetweenPurpleGhostAndPacman: NSLayoutConstraint!
    
    @IBAction func increaseDistanceBetweenPacmanAndGhost(sender: UIButton) {
        self.verticalSpacingBetweenPurpleGhostAndPacman.constant += 100
        UIView.animateWithDuration(1, animations: {
            self.view.layoutIfNeeded()
        })
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

