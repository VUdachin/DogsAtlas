//
//  PetAdding2ndWorker.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import Foundation

protocol PetAdding2ndWorkingLogic {
    func createNewPet(newPet: NewPet, completion: @escaping (NewPet) -> Void)
    func loadPhoto(completion: @escaping () -> Void)
}

final class PetAdding2ndWorker: PetAdding2ndWorkingLogic {
  
    // MARK: - Private Properties
    private let coreDataWorker = CoreDataWoker.shared
    private let context = CoreDataWoker.shared.context

    // MARK: - Working Logic
    func createNewPet(newPet: NewPet, completion: @escaping (NewPet) -> Void) {
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
    
    func loadPhoto(completion: @escaping () -> Void) {
        
    }
}
