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

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var textBoxField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var discoLabel: UILabel!

    var delegate: LabelInfo?
    var discoArray: [String] = ["😄","😉","😘","😳","😜","😝","😂","😖","😎","😯","💩"]
    
    @IBAction func addAndGoBack(sender: UIButton) {
        println("button pressed")
        if textBoxField.text.isEmpty {
            println("Your table view is empty")
            self.textLabel.hidden = false
            self.textLabel.text = "Please add an item to the To Do list."
        } else {
            self.textLabel.hidden = true
            self.delegate?.setLabelText(textBoxField.text)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func textFieldShouldReturn(textField:UITextField) -> Bool {
        println("Return key pressed")
        textField.resignFirstResponder()
        if textBoxField.text.isEmpty {
            println("Your table view is empty")
            self.textLabel.hidden = false
            self.textLabel.text = "Please add an item to the To Do list."
        } else {
            self.textLabel.hidden = true
        }
        return true
    }
        
    func textHasChanged(notification:NSNotification) {
        self.view.backgroundColor = UIColor(red: CGFloat(drand48()),green: CGFloat(drand48()), blue:CGFloat(drand48()), alpha:1)
        var randDiscoNum = arc4random_uniform(11)
        discoLabel.text = discoArray[Int(randDiscoNum)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textLabel.hidden = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"textHasChanged:", name:UITextFieldTextDidChangeNotification, object:nil)
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

