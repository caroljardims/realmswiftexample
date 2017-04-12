//
//  Models.swift
//  RealmTest
//
//  Created by Caroline Siqueira on 12/04/17.
//  Copyright © 2017 Delivery Much. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
    dynamic var name = ""
    dynamic var owner: Person? // Properties can be optional
}

// Person model
class Person: Object {
    dynamic var name = ""
    dynamic var birthdate = NSDate(timeIntervalSince1970: 1)
    let dogs = List<Dog>()
}
