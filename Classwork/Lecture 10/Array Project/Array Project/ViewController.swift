//
//  ViewController.swift
//  Array Project
//
//  Created by Rob Wyant on 1/28/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

protocol LabelInfo {
    func setLabelText(textInfo:String)
}

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    var delegate = LabelInfo?()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func appendToList(sender: UIButton) {
        self.delegate?.setLabelText(textField.text)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

