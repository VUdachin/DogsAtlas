//
//  PetCategoryPresenter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

protocol PetCategoryPresentationLogic {
    func presentFetchedCategories(_ response: PetCategoryModels.FetchPetCategory.Response)
}

final class PetCategoryPresenter: PetCategoryPresentationLogic {

    // MARK: - Public Properties

    weak var viewController: PetCategoryDisplayLogic?

    // MARK: - Private Properties

    // MARK: - Presentation Logic
    func presentFetchedCategories(_ response: PetCategoryModels.FetchPetCategory.Response) {
        let viewModel = PetCategoryModels.FetchPetCategory.ViewModel(category: response.category)

        viewController?.displayFetchedCategories(viewModel)
    }
}
