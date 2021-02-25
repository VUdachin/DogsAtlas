//
//  PetCategoryRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

protocol PetCategoryRoutingLogic {
    func routeToPetData()
}

protocol PetCategoryDataPassing {
    var dataStore: PetCategoryDataStore? { get }
}

final class PetCategoryRouter: PetCategoryRoutingLogic, PetCategoryDataPassing {

    // MARK: - Public Properties
    weak var viewController: PetCategoryViewController?
    var dataStore: PetCategoryDataStore?
  
    // MARK: - Private Properties
    func routeToPetData() {
            let petDataVC = PetDataConfigurator.createScene()
            var petDataDS = petDataVC.router?.dataStore
        passDataToPetAdding2nd(destination: &(petDataDS)!)
        navigateToPetAdding2nd(destination: petDataVC)
    }
    
    // MARK: - Navigation
    private func navigateToPetAdding2nd(destination: PetDataViewController) {
        destination.modalPresentationStyle = .fullScreen
        viewController?.present(destination, animated: true)
    }

    // MARK: - Passing data
    private func passDataToPetAdding2nd(destination: inout PetDataDataStore) {
        destination.category = dataStore?.selectedCategory
    }
    
}
