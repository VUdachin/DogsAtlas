//
//  PetProfileRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 26.10.2020.
//

import UIKit

protocol PetProfileRoutingLogic {

}

protocol PetProfileDataPassing {
  var dataStore: PetProfileDataStore? { get }
}

final class PetProfileRouter: PetProfileRoutingLogic, PetProfileDataPassing {

  // MARK: - Public Properties
  weak var viewController: PetProfileViewController?
  var dataStore: PetProfileDataStore?

  // MARK: - Private Properties

  //

  // MARK: - Routing Logic

  //

  // MARK: - Navigation

  //

  // MARK: - Passing data

  //
}
