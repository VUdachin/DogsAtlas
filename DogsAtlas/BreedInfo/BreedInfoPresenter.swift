//
//  BreedInfoPresenter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 09.10.2020.
//

import UIKit

protocol BreedInfoPresentationLogic {
    func presentFetchedBreedImage(_ response: BreedInfoModels.FetchBreedInfo.Response)
}

final class BreedInfoPresenter: BreedInfoPresentationLogic {

  // MARK: - Public Properties

  weak var viewController: BreedInfoDisplayLogic?

  // MARK: - Private Properties
  
  //

  // MARK: - Presentation Logic
    func presentFetchedBreedImage(_ response: BreedInfoModels.FetchBreedInfo.Response) {
        let viewModel = BreedInfoModels.FetchBreedInfo.ViewModel(breed: response.breed, image: response.image)
        
        viewController?.displayFetchedBreedInfo(viewModel)
    }
  //
}
