//
//  PetAdding1stInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import Foundation

protocol PetAdding1stBusinessLogic {
    func fetchPetCategories(_ request: PetAdding1stModels.FetchPetCategory.Request)
}

protocol PetAdding1stDataStore {
    var categories: [PetCategory]? { get }
}

final class PetAdding1stInteractor: PetAdding1stBusinessLogic, PetAdding1stDataStore {

    // MARK: - Public Properties

    var presenter: PetAdding1stPresentationLogic?
    lazy var worker: PetAdding1stWorkingLogic = PetAdding1stWorker()

    var categories: [PetCategory]?
    // MARK: - Private Properties
    
    
    // MARK: - Business Logic
    func fetchPetCategories(_ request: PetAdding1stModels.FetchPetCategory.Request) {
        worker.fetchPetCategories { (categories) in
            let response = PetAdding1stModels.FetchPetCategory.Response(category: categories)
            
            self.presenter?.presentFetchedCategories(response)
        }
    }
}
