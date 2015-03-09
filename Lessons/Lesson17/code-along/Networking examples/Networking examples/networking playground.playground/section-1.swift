// Playground - noun: a place where people can play

import UIKit
import XCPlayground

// Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()

let url = NSURL(string: "http://www.google.com")

let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
    println(data)
    println(response)
    println(error)
})

task.resume()

