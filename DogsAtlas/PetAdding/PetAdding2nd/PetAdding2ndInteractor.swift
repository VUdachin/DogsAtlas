//
//  PetAdding2ndInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import Foundation

protocol PetAdding2ndBusinessLogic {
    func fetchPet(_ request: PetAdding2ndModels.FetchPet.Request)
    func createPet(_ request: PetAdding2ndModels.PreparePetData.Request)
}

protocol PetAdding2ndDataStore {
    var category: PetCategory? { get set }
    var prepairedData: NewPet? { get }
}

final class PetAdding2ndInteractor: PetAdding2ndBusinessLogic, PetAdding2ndDataStore {

    // MARK: - Public Properties

    var presenter: PetAdding2ndPresentationLogic?
    lazy var worker: PetAdding2ndWorkingLogic = PetAdding2ndWorker()

    var category: PetCategory?
    var prepairedData: NewPet?
    // MARK: - Private Properties

    // MARK: - Business Logic
    func fetchPet(_ request: PetAdding2ndModels.FetchPet.Request) {
        let response = PetAdding2ndModels.FetchPet.Response(category: category!)
        self.presenter?.presentFetchedPet(response)
    }
    
    func createPet(_ request: PetAdding2ndModels.PreparePetData.Request) {
        prepairedData = request.pet
        print(prepairedData)
    }
}

