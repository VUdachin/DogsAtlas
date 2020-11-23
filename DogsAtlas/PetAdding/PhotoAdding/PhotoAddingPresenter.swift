//
//  PhotoAddingPresenter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 23.11.2020.
//

import UIKit

protocol PhotoAddingPresentationLogic {
    func presentFetchedPrepairedData(_ response: PhotoAddingModels.FetchPetData.Response)
}

final class PhotoAddingPresenter: PhotoAddingPresentationLogic {

    // MARK: - Public Properties

    weak var viewController: PhotoAddingDisplayLogic?

    // MARK: - Private Properties

    
    // MARK: - Presentation Logic
    func presentFetchedPrepairedData(_ response: PhotoAddingModels.FetchPetData.Response) {
        let viewModel = PhotoAddingModels.FetchPetData.ViewModel()
        viewController?.displayFetchedPrepairedData(viewModel)
    }
}
