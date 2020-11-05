//
//  PetAdding1stPresenter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding1stPresentationLogic {
    func presentFetchedCategories(_ response: PetAdding1stModels.FetchPetCategory.Response)
}

final class PetAdding1stPresenter: PetAdding1stPresentationLogic {

    // MARK: - Public Properties

    weak var viewController: PetAdding1stDisplayLogic?

    // MARK: - Private Properties

    
    // MARK: - Presentation Logic
    func presentFetchedCategories(_ response: PetAdding1stModels.FetchPetCategory.Response) {
        let viewModel = PetAdding1stModels.FetchPetCategory.ViewModel(category: response.category)
        
        viewController?.displayFetchedCategories(viewModel)
    }
}
