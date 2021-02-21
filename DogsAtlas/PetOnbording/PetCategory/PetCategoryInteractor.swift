//
//  PetCategoryInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import Foundation

protocol PetCategoryBusinessLogic {
    func fetchPetCategories(_ request: PetCategoryModels.FetchPetCategory.Request)
    func selectCategory(_ request: PetCategoryModels.SelectCategory.Request)
}

protocol PetCategoryDataStore {
    var categories: [PetCategory] { get }
    var selectedCategory: PetCategory? { get }
}

final class PetCategoryInteractor: PetCategoryBusinessLogic, PetCategoryDataStore {

    // MARK: - Public Properties

    var presenter: PetCategoryPresentationLogic?
    lazy var worker: PetCategoryWorkingLogic = PetCategoryWorker()

    var categories: [PetCategory] = []
    var selectedCategory: PetCategory?
    // MARK: - Private Properties
    
    
    // MARK: - Business Logic
    func fetchPetCategories(_ request: PetCategoryModels.FetchPetCategory.Request) {
        worker.fetchPetCategories { (categories) in
            self.categories = categories
            let response = PetCategoryModels.FetchPetCategory.Response(category: categories)
            
            self.presenter?.presentFetchedCategories(response)
        }
    }
    
    func selectCategory(_ request: PetCategoryModels.SelectCategory.Request) {
        guard !categories.isEmpty, request.index < categories.count else {
            return
        }
        selectedCategory = categories[request.index]
        print(selectedCategory)
    }
}
