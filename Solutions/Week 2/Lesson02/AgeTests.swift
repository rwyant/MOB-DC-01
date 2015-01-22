//
//  ageTests.swift
//  Lesson02
//
//  Created by Adam Ostrich on 1/14/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

func simpleAgeTest (age: Int?) -> String {
    if let val = age {
        if val >= 21 {
            return "You can drink"
        }
        else if val >= 18 {
            return "You can vote"
        }
        else if val >= 16 {
            return "You can drive"
        }
        else {
            return "You're too young to do much of anything"
        }
    }
    else {
        return "That's not even a thing"
    }
}

func complexAgeTest (age: Int?) -> String {
    if let val = age {
        if val >= 21 {
            return "You can drive, vote, and drink (but not at the same time)"
        }
        else if val >= 18 && val < 21 {
            return "You can drive and vote"
        }
        else if val >= 16 && val < 18 {
            return "You can drive"
        }
        else {
            return "You're too young to do much of anything"
        }
    }
    else {
        return "That's not even a thing"
    }
}