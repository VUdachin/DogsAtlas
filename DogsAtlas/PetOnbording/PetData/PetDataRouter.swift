//
//  PetDataRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

protocol PetDataRoutingLogic {

}

protocol PetDataDataPassing {
    var dataStore: PetDataDataStore? { get }
}

final class PetDataRouter: PetDataRoutingLogic, PetDataDataPassing {

    // MARK: - Public Properties

    weak var parentController: UIViewController?
    weak var viewController: PetDataViewController?
    var dataStore: PetDataDataStore?
  
    // MARK: - Private Properties


    // MARK: - Routing Logic

    
    // MARK: - Navigation
  

    // MARK: - Passing data

}
