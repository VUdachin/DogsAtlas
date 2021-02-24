//
//  PetPhotoWorker.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 22.02.2021.
//

import Foundation

protocol PetPhotoWorkingLogic {
    func createNewPet(newPet: NewPet)
}

final class PetPhotoWorker: PetPhotoWorkingLogic {
  
    // MARK: - Private Properties
    private let coreDataWorker = CoreDataWoker.shared
    private let context = CoreDataWoker.shared.context

    // MARK: - Working Logic
    func createNewPet(newPet: NewPet) {
        let pet = Pet(context: context)
        pet.age = newPet.age
        pet.apointments = newPet.apointments
        pet.category = newPet.category
        pet.sex = newPet.sex
        pet.name = newPet.name
        pet.weight = newPet.weight
        pet.image = newPet.image
        
        coreDataWorker.saveContext()
    }
}
