//
//  AllBreedsListInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 07.10.2020.
//

import Foundation

protocol AllBreedsListBusinessLogic {
    func fetchBreeds(_ request: AllBreedsListModels.FetchBreeds.Request)
    func selectBreed(_ request: AllBreedsListModels.SelectBreed.Request)
}

protocol AllBreedsListDataStore {
    var allBreeds: Breeds { get }
    var selectedBreed: Breed? { get }
}

final class AllBreedsListInteractor: AllBreedsListBusinessLogic, AllBreedsListDataStore {

    // MARK: - Public Properties
    var presenter: AllBreedsListPresentationLogic?
    lazy var worker: AllBreedsListWorkingLogic = AllBreedsListWorker()

    var allBreeds: Breeds = []
    var selectedBreed: Breed?
    // MARK: - Private Properties

    // MARK: - Business Logic
    func fetchBreeds(_ request: AllBreedsListModels.FetchBreeds.Request) {
        worker.fetchBreeds { (allBreeds) in
            let allBreeds = allBreeds ?? []
            let response = AllBreedsListModels.FetchBreeds.Response(breeds: allBreeds)

            self.allBreeds = allBreeds
            self.presenter?.presentFetchedBreeds(response)
        }
    }

    func selectBreed(_ request: AllBreedsListModels.SelectBreed.Request) {
        guard !allBreeds.isEmpty, request.index < allBreeds.count else {
            return
        }
        selectedBreed = allBreeds[request.index]
    }

}
