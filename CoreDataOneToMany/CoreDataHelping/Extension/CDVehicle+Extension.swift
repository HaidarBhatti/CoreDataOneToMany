//
//  CDVehicle+Extension.swift
//  CoreDataOneToMany
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import Foundation

extension CDVehicle{
    func convertToVehicle() -> Vehicle{
        return Vehicle(id: self.id!,
                       name: self.name!,
                       type: self.type!)
    }
}
