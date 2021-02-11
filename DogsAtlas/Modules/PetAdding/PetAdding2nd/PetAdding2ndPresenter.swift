//
//  PetAdding2ndPresenter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding2ndPresentationLogic {
    func presentFetchedPet(_ response: PetAdding2ndModels.FetchPet.Response)
}

final class PetAdding2ndPresenter: PetAdding2ndPresentationLogic {

    // MARK: - Public Properties

    weak var viewController: PetAdding2ndDisplayLogic?

    // MARK: - Private Properties

    
    // MARK: - Presentation Logic
    func presentFetchedPet(_ response: PetAdding2ndModels.FetchPet.Response) {
        let viewModel = PetAdding2ndModels.FetchPet.ViewModel(category: response.category)
        viewController?.displayFetchedPet(viewModel)
    }
}
