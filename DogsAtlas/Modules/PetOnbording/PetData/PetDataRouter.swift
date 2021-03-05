//
//  PetDataRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

protocol PetDataRoutingLogic {
    func routeToPetPhoto()
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
    func routeToPetPhoto() {
        let petPhotoVC = PetPhotoConfigurator.createScene()
        var petPhotoDS = petPhotoVC.router?.dataStore
        passDataToPetPhoto(destination: &(petPhotoDS)!)
        navigateToPetPhoto(destination: petPhotoVC)
    }

    // MARK: - Navigation
    private func navigateToPetPhoto(destination: PetPhotoViewController) {
        destination.modalPresentationStyle = .fullScreen
        viewController?.present(destination, animated: true)
    }

    // MARK: - Passing data
    func passDataToPetPhoto(destination: inout PetPhotoDataStore) {
        destination.prepairedPetData = dataStore?.prepairedData
    }
}
