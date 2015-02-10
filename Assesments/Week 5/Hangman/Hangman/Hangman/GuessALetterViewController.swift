//
//  GuessALetterViewController.swift
//  Hangman
//
//  Created by Rob Wyant on 2/9/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

protocol PassLetter {
    func passLetterText(textInfo:String)
}

class GuessALetterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pickALetterText: UITextField!

    var delegate: PassLetter?
    
    @IBAction func returnToVC(sender: UIButton) {
        self.delegate?.passLetterText(pickALetterText.text)
        self.dismissViewControllerAnimated(true,completion:nil)
    }
    
    func textHasChanged(notification:NSNotification) {
        pickALetterText.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"textHasChanged:", name:UITextFieldTextDidChangeNotification, object:nil)
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
