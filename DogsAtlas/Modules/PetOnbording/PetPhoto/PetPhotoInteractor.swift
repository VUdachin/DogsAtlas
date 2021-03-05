//
//  PetPhotoInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 22.02.2021.
//

import Foundation

protocol PetPhotoBusinessLogic {
    func createPet(request: PetPhotoModels.CreatePet.Request)
}

protocol PetPhotoDataStore {
    var prepairedPetData: NewPet? { get set }
}

final class PetPhotoInteractor: PetPhotoBusinessLogic, PetPhotoDataStore {

    // MARK: - Public Properties

    var presenter: PetPhotoPresentationLogic?
    lazy var worker: PetPhotoWorkingLogic = PetPhotoWorker()

    var prepairedPetData: NewPet?
    // MARK: - Private Properties

    // MARK: - Business Logic

    func createPet(request: PetPhotoModels.CreatePet.Request) {
        prepairedPetData?.image = request.image
        worker.createNewPet(newPet: prepairedPetData!)
    }
}
