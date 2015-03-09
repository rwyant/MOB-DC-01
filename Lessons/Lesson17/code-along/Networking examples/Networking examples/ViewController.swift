//
//  ViewController.swift
//  Networking examples
//
//  Created by Tedi Konda on 3/2/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.google.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            // Pass our NS Data return to a string
            var stringData = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.textView.text = stringData
            })
            
        })
        
        task.resume()
    }


}

