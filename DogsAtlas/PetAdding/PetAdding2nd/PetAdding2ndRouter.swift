//
//  PetAdding2ndRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding2ndRoutingLogic {
    func routeToPhotoAdding()
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
    func routeToPhotoAdding() {
        guard
            let viewController = viewController,
            let storyboard = viewController.storyboard,
            let photoAddingVC = storyboard.instantiateViewController(withIdentifier: "PhotoAddingViewController") as? PhotoAddingViewController,
            var photoAddingDS = photoAddingVC.router?.dataStore else {
            fatalError("Fail route to BreedInfo")
        }
        passDataToPhotoAdding(destination: &photoAddingDS)
        navigateToPhotoAdding(destination: photoAddingVC)
    }
    
    // MARK: - Navigation
    private func navigateToPhotoAdding(destination: PhotoAddingViewController) {
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: - Passing data
    func passDataToPhotoAdding(destination: inout PhotoAddingDataStore) {
        destination.prepairedPetData = dataStore?.prepairedData
    }
}
