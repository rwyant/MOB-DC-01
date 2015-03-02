//
//  Animal.swift
//  Core Data Example
//
//  Created by Rob Wyant on 3/2/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import Foundation
import CoreData

@objc(Animal)

class Animal: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var fur: Bool
    @NSManaged var numberOfLegs: Int32
    @NSManaged var noise: String
    
    
    
}
