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
    
    private weak var navigationController: UINavigationController?
    
    weak var viewController: PetCategoryViewController?
    var dataStore: PetCategoryDataStore?
  
    // MARK: - Private Properties


    func routeToPetAdding2nd() {
        guard
            let vc = PetDataViewController(),
            var petAdding2ndDS = vc.router?.dataStore else {
            fatalError("Fail route to PetAdding2nd")
            }
        passDataToPetAdding2nd(destination: &petAdding2ndDS)
        navigateToPetAdding2nd(destination: petAdding2ndVC)
    }
    
    // MARK: - Navigation
    private func navigateToPetAdding2nd(destination: PetDataViewController) {
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: - Passing data
    private func passDataToPetAdding2nd(destination: inout PetDataDataStore) {
        destination.category = dataStore?.selectedCategory
    }
    
}
