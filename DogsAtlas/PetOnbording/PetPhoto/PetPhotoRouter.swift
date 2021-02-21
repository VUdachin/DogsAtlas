//
//  PetPhotoRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 22.02.2021.
//

import UIKit

protocol PetPhotoRoutingLogic {

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

    
    // MARK: - Navigation
  

    // MARK: - Passing data

}
