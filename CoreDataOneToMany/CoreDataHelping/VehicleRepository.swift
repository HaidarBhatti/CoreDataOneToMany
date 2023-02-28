//
//  VehicleRepository.swift
//  CoreDataOneToMany
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import Foundation
import CoreData

protocol VehicleRepository: BaseRepository{

}

struct VehicleDataRepository: VehicleRepository{
    typealias T = Vehicle

    func create(record: Vehicle) {
        print("create")
    }
    
    func getAll() -> [Vehicle]? {
        print("get all")
        return nil
    }
    
    func get(byIdentifier id: UUID) -> Vehicle? {
        print("get")
        return nil
    }
    
    func update(record: Vehicle) -> Bool {
        print("update")
        return false
    }
    
    func delete(id: UUID) -> Bool {
        guard let cdVehicle = getCDVehicle(byIdentifier: id) else { return false }
        PersistantStorage.shared.context.delete(cdVehicle)
        PersistantStorage.shared.saveContext()
        return true
    }
    
    private func getCDVehicle(byIdentifier id: UUID) -> CDVehicle?{
        let fetchRequest = NSFetchRequest<CDVehicle>(entityName: "CDVehicle")
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
