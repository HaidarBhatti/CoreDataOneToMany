//
//  Vehicle.swift
//  CoreDataOneToMany
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import Foundation

class Vehicle{
    var id: UUID
    var name: String
    var type: String
    
    init(id: UUID, name: String, type: String){
        self.id = id
        self.name = name
        self.type = type
    }
}
