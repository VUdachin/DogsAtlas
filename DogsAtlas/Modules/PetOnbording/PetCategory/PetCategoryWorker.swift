//
//  PetCategoryWorker.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import Foundation

protocol PetCategoryWorkingLogic {
    func fetchPetCategories(completion: @escaping ([PetCategory]) -> Void)
}

final class PetCategoryWorker: PetCategoryWorkingLogic {

    // MARK: - Private Properties
    private let coreDataWorker = CoreDataWoker.shared
    private let context = CoreDataWoker.shared.context

    // MARK: - Working Logic
    func fetchPetCategories(completion: @escaping ([PetCategory]) -> Void) {
        do {
            let loadedCategories: [PetCategory] = try context.fetch(PetCategory.fetchRequest())
            if loadedCategories.count == 0 {
                let dog = PetCategory(context: context)
                dog.categoryName = "Dog"
                dog.image = "dog.png"
                let cat = PetCategory(context: context)
                cat.categoryName = "Cat"
                cat.image = "cat.png"
                let bird = PetCategory(context: context)
                bird.categoryName = "Bird"
                bird.image = "bird.png"
                let lizard = PetCategory(context: context)
                lizard.categoryName = "Lizard"
                lizard.image = "lizard.png"
                let hamster = PetCategory(context: context)
                hamster.categoryName = "Hamster"
                hamster.image = "hamster.png"
                let turtle = PetCategory(context: context)
                turtle.categoryName = "turtle"
                turtle.image = "turtle.png"
                let mouse = PetCategory(context: context)
                mouse.categoryName = "Mouse"
                mouse.image = "mouse.png"
                let fish = PetCategory(context: context)
                fish.categoryName = "Fish"
                fish.image = "fish.png"

                let categories = [dog, cat, bird, lizard, hamster, turtle, mouse, fish]
                completion(categories)

                coreDataWorker.saveContext()

            } else {
                completion(loadedCategories)
            }
        } catch {

        }
    }
}
