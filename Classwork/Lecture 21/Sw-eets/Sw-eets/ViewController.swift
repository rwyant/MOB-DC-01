//
//  ViewController.swift
//  Sw-eets
//
//  Created by Rob Wyant on 3/11/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var sweetCat: UITextField!
    @IBOutlet weak var outputTextView: UITextView!
    
    @IBAction func saveSweets(sender: UIButton) {
        var sweets = PFObject(className: "Sweets")
        sweets["tweets"] = self.tweetTextView.text
        sweets["user"] = "Ena"
        sweets["category"] = self.sweetCat.text
        
        sweets.saveInBackgroundWithBlock { (success, error: NSError!) -> Void in
            if(success) {
                println(sweets.objectId+" Success!")
                self.tweetTextView.text = ""
                self.sweetCat.text = ""
            } else {
                println(error.description)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var query = PFQuery(className: "Sweets")
        query.whereKey("category", equalTo: "Woot")
        query.findObjectsInBackgroundWithBlock { (sweetObject:[AnyObject]!, error:NSError!) -> Void in
            if error == nil {
                println("Successfully")
                
                if let sweetObjects = sweetObject as? [PFObject] {
                    for object in sweetObjects {
                        var queryToPopulateText = PFQuery(className: "Sweets")
                        queryToPopulateText.getObjectInBackgroundWithId(object.objectId, block: { (sweets:PFObject!, error:NSError!) -> Void in
                            if error == nil && sweets != nil {
                                self.outputTextView.text = sweets["tweets"] as String
                            } else {
                                println(error.description)
                            }
                        })
                        
                    }
                }
            } else {
                println(error.description)
            }
        }
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

