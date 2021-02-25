//
//  PetDataConfigurator.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 25.02.2021.
//

import UIKit

class PetDataConfigurator {
    class func createScene() -> PetDataViewController {
        let viewController = PetDataViewController()
        let interactor = PetDataInteractor()
        let presenter = PetDataPresenter()
        let router = PetDataRouter()

        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}


