// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var wayneGretky = ["first_name":"Wayne","last_name":"Gretzky","team":"Capitals"]

wayneGretky["first_name"]

if let wayneName = wayneGretky["first_name"] {
    println(wayneName)
}

var ena: [String:Int] = [:]

ena["legs"] = 4

ena["eyes"] = 2

ena

//ena["eyes"] = nil

ena["paws"] = 4
ena

ena.removeValueForKey("eyes")
ena

for (key, value) in ena {
    println("Ena has \(value) \(key).")
}

for enaKey in ena.keys {
    println("\(enaKey)")
}

for enaValue in ena.values {
    println("\(enaValue)")
}

var articles = [
    ["title":"Ena breaks tail","date":"02/23/15","author":"tedi"],
    ["title":"MOB class does Core Data","date":"02/25/15","author":"Arthur"]
]

for article in articles {
    println(article["title"]!)
}

if let enaArticle = articles[0]["title"] {
    println("\(enaArticle)")
}




