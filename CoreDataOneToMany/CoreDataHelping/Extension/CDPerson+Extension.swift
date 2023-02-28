//
//  File.swift
//  CoreDataOneToMany
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import Foundation

extension CDPerson{
    func convertToPerson() -> Person{
        return Person(id: self.id!,
                      name: self.name!,
                      vehicles: convertToVehicles())
    }
    
    func convertToVehicles() -> [Vehicle]?{
        guard self.toVehicle != nil && self.toVehicle?.count != 0 else { return nil }
        var allVehicles = [Vehicle]()
        self.toVehicle?.forEach({ cdVehicle in
            allVehicles.append(cdVehicle.convertToVehicle())
        })
        return allVehicles
    }
}
