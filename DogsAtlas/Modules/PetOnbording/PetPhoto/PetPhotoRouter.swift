//
//  PetPhotoRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 22.02.2021.
//

import UIKit

protocol PetPhotoRoutingLogic {
    func routeToPetProfile()
}

protocol PetPhotoDataPassing {
    var dataStore: PetPhotoDataStore? { get }
}

final class PetPhotoRouter: PetPhotoRoutingLogic, PetPhotoDataPassing {

    // MARK: - Public Properties

    weak var parentController: UIViewController?
    weak var viewController: PetPhotoViewController?
    var dataStore: PetPhotoDataStore?
  
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
