//
//  PhotoAddingWorker.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 23.11.2020.
//

import Foundation

protocol PhotoAddingWorkingLogic {
    func createNewPet(newPet: NewPet)
}

final class PhotoAddingWorker: PhotoAddingWorkingLogic {
  
    // MARK: - Private Properties
    private let coreDataWorker = CoreDataWoker.shared
    private let context = CoreDataWoker.shared.context

    // MARK: - Working Logic
    func createNewPet(newPet: NewPet) {
        let pet = Pet(context: context)
        pet.age = newPet.age
        pet.apointments = newPet.apointments
        pet.breed = newPet.breed
        pet.category = newPet.category
        pet.gender = newPet.gender
        pet.name = newPet.name
        pet.weight = newPet.weight
        pet.image = newPet.image
        
        coreDataWorker.saveContext()
    }
}
