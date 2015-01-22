//
//  User.swift
//  ClassesExtra
//
//  Created by Thomas Degry on 14/01/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import Foundation

class User: Person {
    var admin:Bool
    
    init(name:String, age:Int, admin:Bool) {
        self.admin = admin
        
        super.init(name: name, age: age)
    }
}