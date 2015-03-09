//
//  ViewController.swift
//  Feedr
//
//  Created by Tedi Konda on 3/2/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit
import SWXMLHash

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    var tempData = ["Ena's tail is apperantly OK", "MOB Class is awesome", "Pigs sighted flying"]
    var url: NSURL?
    var xml: XMLIndexer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = NSURL(string: "http://staging.getyapper.com/yapper/v1/open/yapp/admin/getAll/") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in

                var newXML = SWXMLHash.parse(data)

                self.xml = newXML
                
//                if let Dict: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) {
//                    self.json = jsonDict as? NSDictionary
//                    println(jsonDict)
//                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
        })
            task.resume()
        }

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 1
//        let count = xml["yapps"].all.count
        return count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        if cell == nil  {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        let title = "hello"
//        let title = xml["yapps"]["yapps"]["name"].element?.text
        cell.textLabel?.text = title
        
//        cell.textLabel?.text = self.tempData[indexPath.row]
        return cell
    }
    
    //on click
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        var yapperURL = "http://"
//        var yappID = xml["yapps"]["yapps"]["id"].element?.text
        
//        if let jsonDict = self.json {
//            if let data = jsonDict["data"] as? NSDictionary {
//                if let children = data["children"] as? NSArray {
//                    if let child = children[indexPath.row] as? NSDictionary {
//                        if let childData = child["data"] as? NSDictionary {
//                            if let urlOfChild = childData["url"] as? NSString {
//                                self.url = NSURL(string: urlOfChild)
//                            }
//                        }
//                    }
//                }
//            }
//        }

        performSegueWithIdentifier("web", sender: NSURLRequest(URL: url!))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let request = sender as? NSURLRequest {
            var destinationViewController = segue.destinationViewController as WebViewController
            destinationViewController.request = request
        }
    }


}

