//
//  PetAdding1stWorker.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import Foundation

protocol PetAdding1stWorkingLogic {
    func fetchPetCategories(completion: @escaping ([PetCategory]) -> Void)
}

final class PetAdding1stWorker: PetAdding1stWorkingLogic {
  
    // MARK: - Private Properties
    private let context = CoreDataWoker.shared.context
    
    // MARK: - Working Logic
    func fetchPetCategories(completion: @escaping ([PetCategory]) -> Void) {
        do {
            let loadedCategories: [PetCategory] = try context.fetch(PetCategory.fetchRequest())
            if loadedCategories.count == 0 {
                let dog = PetCategory(context: context)
                dog.categoryName = "Dog"
                let cat = PetCategory(context: context)
                cat.categoryName = "Cat"
                let bird = PetCategory(context: context)
                bird.categoryName = "Bird"
                let lizard = PetCategory(context: context)
                lizard.categoryName = "Lizard"
                
                let categories = [dog, cat, bird, lizard]
                completion(categories)
                print("we fine")
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                completion(loadedCategories)
            }
        } catch {
            
        }
    }
    
}
