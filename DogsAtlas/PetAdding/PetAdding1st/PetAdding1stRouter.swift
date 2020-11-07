//
//  PetAdding1stRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding1stRoutingLogic {
    func routeToPetAdding2nd()
}

protocol PetAdding1stDataPassing {
    var dataStore: PetAdding1stDataStore? { get }
}

final class PetAdding1stRouter: PetAdding1stRoutingLogic, PetAdding1stDataPassing {

    // MARK: - Public Properties

    weak var parentController: UIViewController?
    weak var viewController: PetAdding1stViewController?
    var dataStore: PetAdding1stDataStore?
  
    // MARK: - Private Properties


    // MARK: - Routing Logic
    func routeToPetAdding2nd() {
        guard
            let viewController = viewController,
            let storyboard = viewController.storyboard,
            let petAdding2ndVC = storyboard.instantiateViewController(withIdentifier: "PetAdding2ndViewController") as? PetAdding2ndViewController,
            var petAdding2ndDS = petAdding2ndVC.router?.dataStore else {
            fatalError("Fail route to BreedInfo")
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
