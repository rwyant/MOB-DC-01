// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func knockknock() {
    println("Who's there")
}
knockknock()

func knockMultipleTimes(amountOfTimes:Int) {
    for index in 1...amountOfTimes {
        knockknock()
    }
}
knockMultipleTimes(10)

func replyWhoIsThere(firstName:String,homeCountry:String) {
    println("It's me, \(firstName), from \(homeCountry)")
}


func calculateAge (yearOfBirth:Int) -> Int {
    let currentDate = NSDate()
    let currentCalendar = NSCalendar.currentCalendar()
    let currentYear = currentCalendar.component(NSCalendarUnit.CalendarUnitYear, fromDate: currentDate)
    let age = currentYear - yearOfBirth
    return age
}

func tellNameAndAge (name:String, yearOfBirth: Int) {
    var age = yearOfBirth
    calculateAge(age)
    println("\(name), where \(age) is the var of course!")
}

replyWhoIsThere("Rob","USA")
tellNameAndAge("Rob",1986)


