//
//  PhotoAddingRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 23.11.2020.
//

import UIKit

protocol PhotoAddingRoutingLogic {
    func routeToPetProfile()
}

protocol PhotoAddingDataPassing {
    var dataStore: PhotoAddingDataStore? { get }
}

final class PhotoAddingRouter: PhotoAddingRoutingLogic, PhotoAddingDataPassing {

    // MARK: - Public Properties
    weak var viewController: PhotoAddingViewController?
    var dataStore: PhotoAddingDataStore?
  
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
        navigateToPetProfile(destination: petProfileVC)
    }
    
    // MARK: - Navigation
    private func navigateToPetProfile(destination: PetProfileViewController) {
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: - Passing data
}
