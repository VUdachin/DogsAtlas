//
//  PetProfileConfigurator.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 25.02.2021.
//

import Foundation

class PetProfileConfigurator {
    class func createScene() -> PetProfileViewController {
        let viewController = PetProfileViewController()
        let interactor = PetProfileInteractor()
        let presenter = PetProfilePresenter()
        let router = PetProfileRouter()

        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
