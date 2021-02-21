//
//  PetCategoryRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

protocol PetCategoryRoutingLogic {
    func routeToPetAdding2nd()
}

protocol PetCategoryDataPassing {
    var dataStore: PetCategoryDataStore? { get }
}

final class PetCategoryRouter: PetCategoryRoutingLogic, PetCategoryDataPassing {

    // MARK: - Public Properties

    weak var viewController: PetCategoryViewController?
    var dataStore: PetCategoryDataStore?
  
    // MARK: - Private Properties


    func routeToPetAdding2nd() {
        guard
            let viewController = viewController,
            let storyboard = viewController.storyboard,
            let petAdding2ndVC = storyboard.instantiateViewController(withIdentifier: "PetAdding2ndViewController") as? PetAdding2ndViewController,
            var petAdding2ndDS = petAdding2ndVC.router?.dataStore else {
            fatalError("Fail route to PetAdding2nd")
            }
        passDataToPetAdding2nd(destination: &petAdding2ndDS)
        navigateToPetAdding2nd(destination: petAdding2ndVC)
    }
    
    // MARK: - Navigation
    private func navigateToPetAdding2nd(destination: PetAdding2ndViewController) {
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: - Passing data
    private func passDataToPetAdding2nd(destination: inout PetAdding2ndDataStore) {
        destination.category = dataStore?.selectedCategory
    }
    
}
