//
//  PetProfilePresenter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 26.10.2020.
//

import UIKit

protocol PetProfilePresentationLogic {
    func presentFetchedPets(_ response: PetProfileModels.FetchPets.Response)
}

final class PetProfilePresenter: PetProfilePresentationLogic {

    // MARK: - Public Properties
    weak var viewController: PetProfileDisplayLogic?

    // MARK: - Private Properties

    // MARK: - Presentation Logic
    func presentFetchedPets(_ response: PetProfileModels.FetchPets.Response) {
        let viewModel = PetProfileModels.FetchPets.ViewModel(pets: response.pets)
        viewController?.displayFetchedPets(viewModel)
    }
}
