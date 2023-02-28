//
//  CDVehicle+CoreDataProperties.swift
//  CoreDataOneToMany
//
//  Created by Haidar Bhatti on 28/02/2023.
//
//

import Foundation
import CoreData


extension CDVehicle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDVehicle> {
        return NSFetchRequest<CDVehicle>(entityName: "CDVehicle")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var toPerson: CDPerson?

}

extension CDVehicle : Identifiable {

}
