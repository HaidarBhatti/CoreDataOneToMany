//
//  Person.swift
//  CoreDataOneToMany
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import Foundation

class Person{
    var id: UUID
    var name: String
    var vehicles: [Vehicle]?
    
    init(id: UUID, name: String, vehicles: [Vehicle]? = nil){
        self.id = id
        self.name = name
        self.vehicles = vehicles
    }
}
