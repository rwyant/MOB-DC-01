////
////  FirstViewController.swift
////  Lesson02
////
////  Created by Rudd Taylor on 9/28/14.
////  Copyright (c) 2014 General Assembly. All rights reserved.
////
//
import UIKit



class FirstViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!

    @IBAction func generateTextButton(sender: AnyObject) {
        
        
        /*
        TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’*/

        
        func helloWorld () -> String {
        var helloWorldResult = "Hello World."
            println("TODO ONE: Success.")
            return helloWorldResult
        }
        
        labelText.text = "1) " + helloWorld()
    
        
        /*TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”*/
        
        
        func printText() -> String {
            var name: String = nameText.text
            var age: String = ageText.text
            if name == "" && age == "" {
                println("TODO TWO: Fail, need Name && Age.")
                return ""
            } else if age == "" {
                println("TODO TWO: Fail, need Age.")
                return "Hello \(name)."
            } else if name == "" {
                println("TODO TWO: Fail, need Name.")
                return "Hello, you are \(age) years old!"
            } else {
                println("TODO TWO: Success.")
                return "Hello \(name), you are \(age) years old!"
            }
        }
        
        labelText.text = "1) " + helloWorld() + " 2) " + printText()
    
        
    /*TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”*/
        
        
        func agePermission() -> String {
            var age = ageText.text.toInt()
            var result = ""
            if (age >= 21) {
                println("TODO THREE: Success.")
                result = "You can drink."
            } else if (age >= 18) {
                println("TODO THREE: Success.")
                result = "You can vote."
            } else if (age >= 16) {
                println("TODO THREE: Success.")
                result = "You can drive."
            } else {
                println("TODO THREE: Fail, need Age.")
                result = ""
            }
            return result
        }
            
        labelText.text = "1) " + helloWorld() + " 2) " + printText() + " 3) " + agePermission()
    
    
   /* TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    */

        
        func agePermission2() -> String {
        var age = ageText.text.toInt()
        var result = ""
        if (age >= 16 && age < 18) {
            println("TODO FOUR: Success.")
            result = "You can drive."
        } else if (age >= 18 && age < 21) {
            println("TODO FOUR: Success.")
            result = "You can drive and vote."
        } else if (age >= 21) {
            println("TODO FOUR: Success.")
            result = "You can drive, vote, and drink (but not at the same time!)"
        } else {
            println("TODO FOUR: Fail, need Age.")
            result = ""
            }
        return result
    }
        
    labelText.text = "1) " + helloWorld() + " 2) " + printText() + " 3) " + agePermission() + " 4) " + agePermission2()
        
    }
}

        





