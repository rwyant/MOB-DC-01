//
//  AnimalClass.swift
//  Animal Class
//
//  Created by Rob Wyant on 1/14/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import Foundation

class Animal {
    var species: String = ""
    var name: String = ""
    func stringRepresentation()-> String {
        var strRep = ""
        strRep = "The animal is a \(self.species), it's name is \(self.name)"
        return strRep
    }
    
}