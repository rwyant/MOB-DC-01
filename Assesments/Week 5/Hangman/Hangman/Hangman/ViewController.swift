//
//  ViewController.swift
//  Hangman
//
//  Created by Rob Wyant on 2/8/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var keyboardView: UIView!

    var xValue = 0
    var yValue = 0
    var keyboardValue = 0
    var arrayOfLetters = ["","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",""]
    
    func displayKeyboard() {
        for index in 1...3{
            for i in 1...9 {
                keyboardValue += 1
                var keyboard:UILabel = UILabel(frame: CGRect(x: xValue, y: yValue, width: 0, height: 0))
                keyboard = UILabel(frame:CGRect(x: keyboard.frame.origin.x, y: keyboard.frame.origin.y, width: (self.view.frame.width-32)/9, height: self.keyboardView.frame.height/3))
                keyboard.text = arrayOfLetters[keyboardValue]
                keyboard.textAlignment = NSTextAlignment.Center
                self.keyboardView.addSubview(keyboard)
//                keyboard.backgroundColor = keyboardValue == 27 ? UIColor.clearColor() : keyboardValue % 2 == 0 ? UIColor.redColor() : UIColor.blueColor()
                xValue += Int((self.view.frame.width-32)/9)
            }
            xValue = index == 2 ? Int(((self.view.frame.width-32)/9/2)) : 0
            yValue += Int(self.keyboardView.frame.height/3)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayKeyboard()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

