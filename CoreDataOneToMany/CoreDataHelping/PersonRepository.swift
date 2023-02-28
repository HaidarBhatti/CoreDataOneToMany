//
//  PersonRepository.swift
//  CoreDataOneToMany
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import Foundation
import CoreData

protocol PersonRepository: BaseRepository{

}

struct PersonDataRepository: PersonRepository{
    typealias T = Person
    
    func create(record: Person) {
        let cdPerson = CDPerson(context: PersistantStorage.shared.context)
        cdPerson.id = record.id
        cdPerson.name = record.name
        if record.vehicles != nil && record.vehicles?.count != 0 {
            var vehicleSet = Set<CDVehicle>()
            record.vehicles?.forEach({ vehicle in
                let cdVehicle = CDVehicle(context: PersistantStorage.shared.context)
                cdVehicle.id = vehicle.id
                cdVehicle.name = vehicle.name
                cdVehicle.type = vehicle.type
                vehicleSet.insert(cdVehicle)
            })
            cdPerson.toVehicle = vehicleSet
        }
        PersistantStorage.shared.saveContext()
    }
    
    func getAll() -> [Person]? {
        guard let result = PersistantStorage.shared.fetchManagedObject(managedObject: CDPerson.self) else { return nil }
        var allPerson: [Person] = []
        result.forEach { cdPerson in
            allPerson.append(cdPerson.convertToPerson())
        }
        return allPerson
    }
    
    func get(byIdentifier id: UUID) -> Person? {
        guard let result = getCDPerson(byIdentifier: id) else { return nil }
        return result.convertToPerson()
    }
    
    func update(record: Person) -> Bool {
        guard let cdPerson = getCDPerson(byIdentifier: record.id) else { return false }
        cdPerson.name = record.name
        if record.vehicles != nil && record.vehicles?.count != 0 {
            var vehicleSet = Set<CDVehicle>()
            record.vehicles?.forEach({ vehicle in
                let cdVehicle = CDVehicle(context: PersistantStorage.shared.context)
                cdVehicle.id = vehicle.id
                cdVehicle.name = vehicle.name
                cdVehicle.type = vehicle.type
                vehicleSet.insert(cdVehicle)
            })
            cdPerson.toVehicle = vehicleSet
        }
        PersistantStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        guard let cdPerson = getCDPerson(byIdentifier: id) else { return false }
        PersistantStorage.shared.context.delete(cdPerson)
        PersistantStorage.shared.saveContext()
        return true
    }
    
    private func getCDPerson(byIdentifier id: UUID) -> CDPerson?{
        let fetchRequest = NSFetchRequest<CDPerson>(entityName: "CDPerson")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistantStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else { return nil }
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
