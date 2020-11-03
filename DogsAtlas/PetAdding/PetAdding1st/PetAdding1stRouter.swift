//
//  PetAdding1stRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding1stRoutingLogic {

}

protocol PetAdding1stDataPassing {
    var dataStore: PetAdding1stDataStore? { get }
}

final class PetAdding1stRouter: PetAdding1stRoutingLogic, PetAdding1stDataPassing {

    // MARK: - Public Properties

    weak var parentController: UIViewController?
    weak var viewController: PetAdding1stViewController?
    var dataStore: PetAdding1stDataStore?
  
    // MARK: - Private Properties


    // MARK: - Routing Logic

    
    // MARK: - Navigation
  

    // MARK: - Passing data

}
