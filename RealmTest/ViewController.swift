//
//  ViewController.swift
//  RealmTest
//
//  Created by Caroline Siqueira on 12/04/17.
//  Copyright © 2017 Delivery Much. All rights reserved.
//

import UIKit
import Realm
import RealmSwift


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let jim = Person()
        let rex = Dog()
        
        jim.name = "Jim"
        jim.birthdate = NSDate(timeIntervalSince1970: 1431025588)
        
        rex.name = "Rex"
        rex.owner = jim
        
        let tobby = Dog()
        tobby.name = "Tobby"
        tobby.owner = jim
        
        jim.dogs.append(rex)
        jim.dogs.append(tobby)
        
        let realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "TemporaryRealm"))
        
        try! realm.write {
            realm.add(rex)
            realm.add(tobby)
        }
        
        let savedOnRealm = realm.objects(Dog.self)
        
        for s in savedOnRealm {
            print("Here is " + s.name + ". Rex owner is " + (s.owner?.name)!)
            for d in (s.owner?.dogs)!{
                print(" " + (s.owner?.name)! + " has " + d.name)
            }
        }
    }
}

