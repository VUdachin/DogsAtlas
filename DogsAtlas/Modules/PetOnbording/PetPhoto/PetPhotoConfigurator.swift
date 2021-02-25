//
//  PetPhotoConfigurator.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 25.02.2021.
//

import UIKit

class PetPhotoConfigurator {
    class func createScene() -> PetPhotoViewController {
        let viewController = PetPhotoViewController()
        let interactor = PetPhotoInteractor()
        let presenter = PetPhotoPresenter()
        let router = PetPhotoRouter()

        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
            
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
