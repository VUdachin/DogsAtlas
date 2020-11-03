//
//  PetAdding2ndRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding2ndRoutingLogic {

}

protocol PetAdding2ndDataPassing {
    var dataStore: PetAdding2ndDataStore? { get }
}

final class PetAdding2ndRouter: PetAdding2ndRoutingLogic, PetAdding2ndDataPassing {

    // MARK: - Public Properties

    weak var parentController: UIViewController?
    weak var viewController: PetAdding2ndViewController?
    var dataStore: PetAdding2ndDataStore?
  
    // MARK: - Private Properties


    // MARK: - Routing Logic

    
    // MARK: - Navigation
  

    // MARK: - Passing data

}
