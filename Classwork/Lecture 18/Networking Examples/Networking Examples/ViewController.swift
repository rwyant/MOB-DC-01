//
//  ViewController.swift
//  Networking Examples
//
//  Created by Rob Wyant on 3/2/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://prod.getyapper.com/yapper/v1/open/yapp/portal/getAll/")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            var stringData = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if error != nil {
                    self.textView.text = "There was an error reaching the domain."
                } else {
                    self.textView.text = stringData
                }
            })

        })
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

