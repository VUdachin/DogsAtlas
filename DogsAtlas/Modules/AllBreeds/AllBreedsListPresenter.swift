//
//  AllBreedsListPresenter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 07.10.2020.
//

import UIKit

protocol AllBreedsListPresentationLogic {
    func presentFetchedBreeds(_ response: AllBreedsListModels.FetchBreeds.Response)
}

final class AllBreedsListPresenter: AllBreedsListPresentationLogic {
    
    // MARK: - Public Properties
    weak var viewController: AllBreedsListDisplayLogic?

    // MARK: - Private Properties
  


    // MARK: - Presentation Logic
    func presentFetchedBreeds(_ response: AllBreedsListModels.FetchBreeds.Response) {
        let viewModel = AllBreedsListModels.FetchBreeds.ViewModel(breeds: response.breeds)
        
        viewController?.displayFetchedBreeds(viewModel)
    }

}
