//
//  ViewController.swift
//  testingXML
//
//  Created by Rob Wyant on 3/5/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit
import SWXMLHash

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var someValue:XMLIndexer?
        if let url = NSURL(string: "http://staging.getyapper.com/yapper/v1/open/yapp/portal/getAll/") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                
                var newXML = SWXMLHash.parse(data)
                var count = newXML["yapps"]["id"][0].element?.text
                    println("Hello \(count)")
                someValue = newXML
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    self.view.reloadData()
//                })
            })
            task.resume()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

