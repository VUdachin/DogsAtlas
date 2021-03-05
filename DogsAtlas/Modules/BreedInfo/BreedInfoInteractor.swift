//
//  BreedInfoInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 09.10.2020.
//

import Foundation

protocol BreedInfoBusinessLogic {
    func fetchBreedInfo(_ request: BreedInfoModels.FetchBreedInfo.Request)
}

protocol BreedInfoDataStore {
    var breed: Breed? { get set }
}

final class BreedInfoInteractor: BreedInfoBusinessLogic, BreedInfoDataStore {

  // MARK: - Public Properties
    var presenter: BreedInfoPresentationLogic?
    lazy var worker: BreedInfoWorkingLogic = BreedInfoWorker()

    var breed: Breed?
  // MARK: - Private Properties

  // MARK: - Business Logic
    func fetchBreedInfo(_ request: BreedInfoModels.FetchBreedInfo.Request) {
        guard let breed = breed else {
            return
        }

        worker.fetchBreedImage(imageId: breed.id) { (image) in
            let response = BreedInfoModels.FetchBreedInfo.Response(breed: breed, image: image)

            self.presenter?.presentFetchedBreedImage(response)

        }
    }

}
