//
//  ViewController.swift
//  Animal Class
//
//  Created by Rob Wyant on 1/14/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func catButton(sender: AnyObject) {
        var cat = Animal()
        cat.name = "Tipitina"
        cat.species = "Cat"
        var image : UIImage! = UIImage (named:"kitten.jpg")
        imageView.image = image
        
        labelField.text = cat.stringRepresentation()
    }

    @IBAction func dogButton(sender: AnyObject) {
        var dog = Animal()
        dog.species = "Dog"
        dog.name = "Hercules"
        var image : UIImage! = UIImage (named:"puppy.jpg")
        imageView.image = image
        labelField.text = dog.stringRepresentation()
    }
    
    @IBAction func startOverButton(sender: AnyObject) {
        var image : UIImage! = UIImage (named:"catVdog.jpg")
        imageView.image = image
        labelField.text = "Please create either a     Cat or Dog."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

