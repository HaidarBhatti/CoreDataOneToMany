//
//  ViewController.swift
//  CoreDataOneToMany
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import UIKit

class ViewController: UIViewController {

    private let manager = PersonManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? "Not Found!")
        
        createPerson()
        getSavedPerson()
    }
    
    func createPerson(){
        let vehicle0 = Vehicle(id: UUID(), name: "Audi S3", type: "Car")
        let vehicle1 = Vehicle(id: UUID(), name: "Audi Q7", type: "Car")
        let person = Person(id: UUID(), name: "Fezan", vehicles: [vehicle0, vehicle1])
       
        if manager.createPerson(person: person){
            print("data saved successfully.")
        }
        else{
            print("failed to save data.")
        }
    }
    
    func getSavedPerson(){
        guard let perons = manager.getAllPerson() else { return }
        perons.forEach { person in
            if person.vehicles != nil && person.vehicles?.count != 0{
                person.vehicles?.forEach({ vehicle in
                    print("\(person.name) has \(vehicle.name) which is \(vehicle.type).")
                })
            }
        }
    }

}

