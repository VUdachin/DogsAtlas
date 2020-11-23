//
//  PhotoAddingInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 23.11.2020.
//

import Foundation

protocol PhotoAddingBusinessLogic {
    func fetchPrepairedData(_ request: PhotoAddingModels.FetchPetData.Request)
    func createPet(request: PhotoAddingModels.CreatePet.Request)
}

protocol PhotoAddingDataStore {
    var prepairedPetData: NewPet? { get set }
}

final class PhotoAddingInteractor: PhotoAddingBusinessLogic, PhotoAddingDataStore {

    // MARK: - Public Properties

    var presenter: PhotoAddingPresentationLogic?
    lazy var worker: PhotoAddingWorkingLogic = PhotoAddingWorker()

    var prepairedPetData: NewPet?
    // MARK: - Private Properties

    // MARK: - Business Logic
    func fetchPrepairedData(_ request: PhotoAddingModels.FetchPetData.Request) {
        let response = PhotoAddingModels.FetchPetData.Response()
        presenter?.presentFetchedPrepairedData(response)
    }
    
    func createPet(request: PhotoAddingModels.CreatePet.Request) {
        prepairedPetData?.image = request.image
        worker.createNewPet(newPet: prepairedPetData!)
    }
}
