//
//  PetDataInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import Foundation

protocol PetDataBusinessLogic {
    func fetchPet(_ request: PetDataModels.FetchPet.Request)
    func createPet(_ request: PetDataModels.PreparePetData.Request)
}

protocol PetDataDataStore {
    var category: PetCategory? { get set }
    var prepairedData: NewPet? { get }
}

final class PetDataInteractor: PetDataBusinessLogic, PetDataDataStore {

    // MARK: - Public Properties

    var presenter: PetDataPresentationLogic?
    lazy var worker: PetDataWorkingLogic = PetDataWorker()

    var category: PetCategory?
    var prepairedData: NewPet?
    // MARK: - Private Properties

    // MARK: - Business Logic
    func fetchPet(_ request: PetDataModels.FetchPet.Request) {
        let response = PetDataModels.FetchPet.Response(category: category!)
        self.presenter?.presentFetchedPet(response)
    }

    func createPet(_ request: PetDataModels.PreparePetData.Request) {
        prepairedData = request.pet
    }
}
