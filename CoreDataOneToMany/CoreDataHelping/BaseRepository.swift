//
//  BaseRepository.swift
//  CoreDataOneToMany
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import Foundation

protocol BaseRepository{
    associatedtype T
    
    func create(record: T)
    func getAll() -> [T]?
    func get(byIdentifier id: UUID) -> T?
    func update(record: T) -> Bool
    func delete(id: UUID) -> Bool
}
