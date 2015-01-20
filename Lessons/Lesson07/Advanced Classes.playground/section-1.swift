// Playground - noun: a place where people can play

import UIKit

// Observer pattern: allows an object to publish changes to its state. Useful for doing things like data binding with UI. This is particularly useful for decoupling our models with our views, because our models can notify our views when a change has been made.
// We are implementing this through the two property observers (willSet and didSet). 
// Note: these do not apply on initialization. They are only relevant if a property changes after the object has been initialized.

// Example:
class ScoreKeeper {
    var score: Int = 0 {
        
        // newScore is a temporary variable that we have access to as we are setting it
        willSet(newScore) {
            println("About to set total score to \(newScore)")
        }
        
        // didSet gives us access to the oldValue so we can run an operation on it
        didSet {
            if score > oldValue  {
                println("Added \(score - oldValue) points")
            }
        }
    }
}

let scoreKeeper = ScoreKeeper()
scoreKeeper.score = 200
scoreKeeper.score = 300
scoreKeeper.score = 400

// TO DO: Build a HealthKeeper class that:
//  - defaults player health to 100
//  - lets you add/remove health
//  - if health grows over 100, let the user know they are in super mode (this would play the role of a glowing health bar)
//  - if the health drops from 100+ to -100, let the user know they are mortal again
// - if health drops to/below 0, tell the user they are dead
// - recommendation: handle this through a method that gets called through the property obbservers


// Prototype pattern: The prototype pattern is used to instantiate a new object by copying all of the properties of an existing object, creating an independent clone. This practise is particularly useful when the construction of a new object is inefficient.
// Note when you have var ena = Animal(); var anotherDog = ena;, both the variables will be changing the properties of the same object. This allows us to actually clone an object without it just being a reference (which is a property of classes)

// A good funcitonal example is each cell in a Table View comes from a prototype. Only the information in those cells changes.

// Example:
class Person {
    var name: String?
    let height: Int
    
    init(height: Int) {
        self.height = height
    }
    
    func clone() -> Person {
        return Person(height:self.height)
    }
}

let triplets = Person(height:6)

let tedi = triplets.clone()
tedi.name = "Tedi"

let martin = triplets.clone()
martin.name = "Martin"

let john = triplets.clone()
john.name = "John"

// TO DO: create a car factory that is completely modular. 
// - You have a prototype car that you can clone, however that prototype car also has modules for wheels (wheel type, wheel size).
// - Create a class for each module 
// - Instentiate 3 different car model per maker with defauls for each of those modules as the baseline. (ex: Toyota Corolla (prototype) has highway wheels, Toyota Supra has racing wheels, etc).


// Singleton: the singleton pattern ensures that only one object of a particular class is ever created. All further references to objects of the singleton class refer to the same underlying instance. A great example of this is the app delegate that our applicaitons start with. Our apps are instances of App. 
// Another example is the notification center. We only need one central notification center to control all of our broadcasted messages.
// Final example: our database representation. Core Data gives us a single instance to communicate to our databases with.
// Good post describing Singletons at a high level: http://assoc.tumblr.com/post/51302471844/the-misunderstood-singleton

// Example:
class SingletonClass {
    class var shared : SingletonClass {
        
        struct Static {
            static let instance : SingletonClass = SingletonClass()
        }
        
        return Static.instance
    }
}

let instance = SingletonClass.shared

// TO DO: Logging mechanism is a great example of a singleton usecase. Create a logging mechanism to log information and display information. Hint: this may require either the use of an array or dictionary, which we can't gone into great detail about.
