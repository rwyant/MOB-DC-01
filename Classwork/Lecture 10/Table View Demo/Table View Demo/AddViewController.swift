//
//  AddViewController.swift
//  Table View Demo
//
//  Created by Rob Wyant on 1/28/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

protocol Campus {
    func addCampus(campusName:String)
}

class AddViewController: UIViewController {
    
    @IBOutlet weak var addTextBox: UITextField!
    @IBOutlet weak var hiddenLabel: UILabel!
    
    var delegate: Campus?
    
    @IBAction func saveAndGoBack(sender: UIButton) {
        self.delegate?.addCampus(addTextBox.text)
        self.dismissViewControllerAnimated(true,completion:nil)
    }

    @IBAction func apendList(sender: UIButton) {
    }
    
    @IBAction func pressPostButton(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("unhideHiddenLabels", object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hiddenLabel.hidden = true
        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "unhideCurrentLabels:", name: "unhideHiddenLabels", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"textHasChanged:", name:UITextFieldTextDidChangeNotification, object:nil)
    }
    
    func textHasChanged(notification:NSNotification) {
        println("Horray, text has changed!")
    }
    
    func unhideCurrentLabels(notification:NSNotification) {
        self.hiddenLabel.hidden = false
        println("Triggered unhideHiddenLabels notification")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
