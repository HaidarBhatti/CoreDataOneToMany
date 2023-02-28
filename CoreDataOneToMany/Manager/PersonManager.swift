//
//  PersonManager.swift
//  CoreDataOneToMany
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import Foundation

struct PersonManager{
    
    private let manager = PersonDataRepository()
    
    func createPerson(person: Person) -> Bool {
        guard person.vehicles != nil && person.vehicles!.count <= 2 else { return false }
        manager.create(record: person)
        return true
    }
    
    func getAllPerson() -> [Person]?{
        return manager.getAll()
    }
    
    func getPerson(identifier: UUID) -> Person?{
        return manager.get(byIdentifier: identifier)
    }
    
    func updatePerson(person: Person) -> Bool{
        return manager.update(record: person)
    }
    
    func deletePerson(id: UUID) -> Bool{
        return manager.delete(id: id)
    }
    
}
