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
            let categories: [PetCategory] = try context.fetch(PetCategory.fetchRequest())
            completion(categories)
        }
        catch {
            
        }
        
    }
}
