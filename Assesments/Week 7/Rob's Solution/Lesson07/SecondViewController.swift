//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    func sliderValueDidChange(sender:UISlider!) {
        var settingsString:AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("settings_name")
        if settingsString == nil {
            settingsString = "nil"
        }
        self.textView.text = "The NAME in Settings is: \(settingsString!)\nThe VALUE has been changed to \(sender.value)"
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(sender.value, forKey: "settings_slider")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var settingsString:AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("settings_name")
        var settingsSlider:AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("settings_slider")
        if settingsString == nil {
            NSUserDefaults.standardUserDefaults().setObject("Set in Settings", forKey: "settings_name")
            settingsString = "Set in Settings"
        }
        if settingsSlider == nil {
            NSUserDefaults.standardUserDefaults().setObject(0.5, forKey: "settings_slider")
            settingsSlider = 0.5
        }
        
        var nameLabel = UILabel(frame:CGRectMake(20,200,60,40))
        var nameText = UILabel(frame:CGRectMake(80,200,220,40))
        nameLabel.text = "Name"
        nameText.text = "\(settingsString!)"
        self.view.addSubview(nameLabel)
        self.view.addSubview(nameText)
        
        var sliderDemo = UISlider(frame:CGRectMake(20, 260, 280, 20))
        sliderDemo.minimumValue = 0
        sliderDemo.maximumValue = 1
        sliderDemo.continuous = true
        sliderDemo.tintColor = UIColor.redColor()
        sliderDemo.value = settingsSlider as Float
        sliderDemo.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(sliderDemo)
        
        self.textView.text = "The NAME in Settings is: \(settingsString!) \nThe VALUE of the Slider is: \(settingsSlider!)."
        
        // Do any additional setup after loading the view.
    }
}
