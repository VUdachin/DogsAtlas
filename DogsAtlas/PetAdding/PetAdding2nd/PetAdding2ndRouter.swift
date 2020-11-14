//
//  PetAdding2ndRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding2ndRoutingLogic {
    func routeToPetProfile()
}

protocol PetAdding2ndDataPassing {
    var dataStore: PetAdding2ndDataStore? { get }
}

final class PetAdding2ndRouter: PetAdding2ndRoutingLogic, PetAdding2ndDataPassing {

    // MARK: - Public Properties
    weak var viewController: PetAdding2ndViewController?
    var dataStore: PetAdding2ndDataStore?
  
    // MARK: - Private Properties


    // MARK: - Routing Logic
    func routeToPetProfile() {
        guard
            let viewController = viewController,
            let storyboard = viewController.storyboard,
            let petProfileVC = storyboard.instantiateViewController(withIdentifier: "PetProfileViewController") as? PetProfileViewController,
            var petProfileDS = petProfileVC.router?.dataStore else {
            fatalError("Fail route to BreedInfo")
        }
//        passDataToPetAdding2nd(destination: &petProfileDS)
        navigateToPetProfile(destination: petProfileVC)
    }
    
    // MARK: - Navigation
    private func navigateToPetProfile(destination: PetProfileViewController) {
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: - Passing data
//    private func passDataToPetAdding2nd(destination: inout PetAdding2ndDataStore) {
//        destination.category = dataStore?.selectedCategory
//    }
    
}
