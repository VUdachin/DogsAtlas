//
//  PetDataRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

protocol PetDataRoutingLogic {
    func routeToPhotoAdding()
}

protocol PetDataDataPassing {
    var dataStore: PetDataDataStore? { get }
}

final class PetDataRouter: PetDataRoutingLogic, PetDataDataPassing {

    // MARK: - Public Properties

    weak var viewController: PetDataViewController?
    var dataStore: PetDataDataStore?
  
    // MARK: - Private Properties


    // MARK: - Routing Logic
    func routeToPhotoAdding() {
        guard
            let viewController = viewController,
            let storyboard = viewController.storyboard,
            let photoAddingVC = storyboard.instantiateViewController(withIdentifier: "PhotoAddingViewController") as? PetPhotoViewController,
            var photoAddingDS = photoAddingVC.router?.dataStore else {
            fatalError("Fail route to BreedInfo")
        }
        passDataToPhotoAdding(destination: &photoAddingDS)
        navigateToPhotoAdding(destination: photoAddingVC)
    }
    
    // MARK: - Navigation
    private func navigateToPhotoAdding(destination: PetPhotoViewController) {
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: - Passing data
    func passDataToPhotoAdding(destination: inout PetPhotoDataStore) {
        destination.prepairedPetData = dataStore?.prepairedData
    }
}
