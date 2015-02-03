import Cocoa


// Create array with an array literal
var shoppingList: [String] = ["Shoes", "Developer license", "5k Mac", "iPhone 6+"]

shoppingList[1] = "Apple Watch"
// Modify second item in array

shoppingList[1...2] = ["Shoes", "Sunglasses"]
// Modify second and third items in array

// Short hand of array literal
var shorterShoppingList = ["5k Mac", "iPhone 6+"]

var fruits = ["apple", "orange", "bannana", "pear"]

// Iterating over fruits array
for fruit in fruits {
    println(fruit)
}

// Create array using the convenience syntax
let areaCodes = [Int]()

// Create array with given number of given elements, each with the same value

var luckyNumbers = Array(count: 3, repeatedValue: 7)

var newLuckyNumbers = luckyNumbers.map { $0 * 3 }

// Append new integers to the array
newLuckyNumbers + [5, 2, 4]

//Filter only numbers divisible by 7
let onlyLuckyNumbers = newLuckyNumbers.filter { $0 % 7 == 0}

var personNames = ["Tedi", "Rudd", 7, 11]

var types = [AnyObject]()
types.append("tedi")
types.append(55)
types.count

var dogs: [String] = ["Ena", "Regi"]
dogs
dogs.reverse()
var diff = ["tedi", 25, 12.04]
diff[0]

var names = ["Tedi", "Ena"]

names.append("Laura")

names.isEmpty
names.removeLast()

names.reverse()

names.last
names.insert("George", atIndex: 2)

let nameCount = names.count
names[0...nameCount-1]
names.removeAtIndex(0)
names
//iterating over array
//for item in array
//for (index, value) in enumerate
for item in names {
    item
}

for (index, value) in enumerate(names) {
    "index is \(index)"
    value
}

var someInts = [Int]()
someInts.append(3)
someInts = []

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)

var sixDoubles = threeDoubles + anotherThreeDoubles

var numbers = [20, 19, 7, 12]
var newNumbers = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

// Dictionaries

// Create using initializer
var emptyDict = Dictionary<String, Int>()

// Create using convenience syntax
var anotherEmptyDict = [String: Int]()

// Create using dictionary literals
var gaCampuses: [String: String] = ["ny": "New York", "la": "Los Angeles", "dc": "District of Columbia"]

// Update a value using subscript syntax
gaCampuses["dc"] = "Washington DC"

// Update using updatevalue method
gaCampuses.updateValue("New York City", forKey: "ny")

// Add a key/value pair using the same subscripting syntax as you did for updating
gaCampuses["sf"] = "San Francisco"

// Remove key value pair by setting the value to nil
gaCampuses["la"] = nil

// Remove key value pair using the removeValueForKey method
gaCampuses.removeValueForKey("sf")

// Creating using literal in short form
var newGaCampuses = ["au": "Austin", "ci": "Chicago", "hk": "Hong Kong"]

// Iterate over dictionary keys
for campusKey in newGaCampuses.keys {
    println("GA campus code: \(campusKey)")
}

// Iterate over dictionary values
for campusValue in newGaCampuses.values {
    println("GA campus in \(campusValue)")
}

// Iterate over both keys and values
for (campusKey, campusValue) in newGaCampuses {
    println("\(campusKey): \(campusValue)")
}


var arrayOfDicts = [gaCampuses]
arrayOfDicts.append(["au": "Austin", "ci": "Chicago", "hk": "Hong Kong"])
for campus in arrayOfDicts {
    campus["au"]
}

