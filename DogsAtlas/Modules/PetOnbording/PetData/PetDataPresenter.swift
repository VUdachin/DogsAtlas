//
//  PetDataPresenter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

protocol PetDataPresentationLogic {
    func presentFetchedPet(_ response: PetDataModels.FetchPet.Response)
}

final class PetDataPresenter: PetDataPresentationLogic {

    // MARK: - Public Properties

    weak var viewController: PetDataDisplayLogic?

    // MARK: - Private Properties

    
    // MARK: - Presentation Logic
    func presentFetchedPet(_ response: PetDataModels.FetchPet.Response) {
        let viewModel = PetDataModels.FetchPet.ViewModel(category: response.category)
        viewController?.displayFetchedPet(viewModel)
    }
}
