//
//  PetCategoryConfigurator.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 25.02.2021.
//

import Foundation

class PetCategoryConfigurator {
    class func createScene() -> PetCategoryViewController {
        let viewController = PetCategoryViewController()
        let interactor = PetCategoryInteractor()
        let presenter = PetCategoryPresenter()
        let router = PetCategoryRouter()

        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
