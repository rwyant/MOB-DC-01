//
//  ViewController.swift
//  Feedr
//
//  Created by Tedi Konda on 3/2/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    var tempData = ["Ena's tail is apperantly OK", "MOB Class is awesome", "Pigs sighted flying"]
        var url: NSURL?
    
    var json: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = NSURL(string: "http://mashable.com/stories.json") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in

                if let jsonDict: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) {
                    self.json = jsonDict as? NSDictionary
                    println(jsonDict)
                }
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
        if let jsonData = self.json {
            if let newData = jsonData["new"] as? NSArray {
                    return newData.count
                }
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        if cell == nil  {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        }
        
        if let jsonData = self.json {
            if let newData = jsonData["new"] as? NSArray {
                if let child = newData[indexPath.row] as? NSDictionary {
                    if let title = child["title"] as? NSString {
                        cell.textLabel?.text = title
                    }
                    if let author = child["author"] as? NSString {
                        cell.detailTextLabel?.text = author
                        println("the author worked! \(author)")
                    }
                }
            }
        }
        
        
//        cell.textLabel?.text = self.tempData[indexPath.row]
        return cell
    }
    
    //on click
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if let jsonData = self.json {
            if let newData = jsonData["new"] as? NSArray {
                if let child = newData[indexPath.row] as? NSDictionary {
                    if let urlOfChild = child["link"] as? NSString {
                        self.url = NSURL(string: urlOfChild)
                    }
                }
            }
        }

        performSegueWithIdentifier("web", sender: NSURLRequest(URL: url!))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let request = sender as? NSURLRequest {
            var destinationViewController = segue.destinationViewController as WebViewController
            destinationViewController.request = request
        }
    }


}

