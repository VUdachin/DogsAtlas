//
//  PetProfileInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 26.10.2020.
//

import Foundation
import CoreData

protocol PetProfileBusinessLogic {
    func fetchPets(_ request: PetProfileModels.FetchPets.Request)
}

protocol PetProfileDataStore {

}

final class PetProfileInteractor: PetProfileBusinessLogic, PetProfileDataStore {

    // MARK: - Public Properties

    var presenter: PetProfilePresentationLogic?
    lazy var worker: PetProfileWorkingLogic = PetProfileWorker()

    // MARK: - Private Properties
    

    // MARK: - Business Logic
    func fetchPets(_ request: PetProfileModels.FetchPets.Request) {
        worker.fetchPetsFromLocalDataStore { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let result):
                let response = PetProfileModels.FetchPets.Response(pets: result)
                self.presenter?.presentFetchedPets(response)
            }
        }
    }

}
