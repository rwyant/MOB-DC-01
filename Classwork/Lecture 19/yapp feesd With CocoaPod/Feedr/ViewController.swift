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
    
    var json: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = NSURL(string: "https://prod.getyapper.com/yapper/v1/open/yapp/getAll?from_start_date=2015-02-05&to_end_date=2017-02-05") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                
                let newJsonDict = JSON(data: data)
                self.json = newJsonDict
                    println(newJsonDict)
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
            if let newData = jsonData["yapps"].array  {
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
            cell.textLabel?.text = jsonData["yapps"][indexPath.row]["name"].string
            cell.detailTextLabel?.text = jsonData["yapps"][indexPath.row]["yappRank"].string
        }
        return cell
    }
    
    //on click
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if let jsonData = self.json {
            var urlOfChild = jsonData["yapps"][indexPath.row]["id"].string
            println(urlOfChild)
            self.url = NSURL(string: "https://prod.getyapper.com/yapper/app/landing.html#/yapp/\(urlOfChild!)")
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

