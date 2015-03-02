//
//  ViewController.swift
//  Core Data Example
//
//  Created by Rob Wyant on 3/2/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    @IBAction func loadAnimalData(sender: UIButton) {
        if let moc = self.appDelegate.managedObjectContext {
            let fetchAnimals = NSFetchRequest(entityName: "Animal")
            let animalPredicate = NSPredicate(format: "name contains %@", "ob")
            fetchAnimals.predicate = animalPredicate
            
            if let animals: [Animal] = moc.executeFetchRequest(fetchAnimals, error: nil) as? [Animal] {
                for animal in animals {
                    println(animal.name)
                    println(animal.noise)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let moc = self.appDelegate.managedObjectContext {
            var ena = NSEntityDescription.insertNewObjectForEntityForName("Animal", inManagedObjectContext: moc) as Animal
            ena.name = "Rob"
            ena.numberOfLegs = 4
            ena.noise = "Woof woof!"
            ena.fur = true
            appDelegate.saveContext()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

