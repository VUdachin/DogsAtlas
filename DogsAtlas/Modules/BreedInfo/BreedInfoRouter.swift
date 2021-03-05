//
//  BreedInfoRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 09.10.2020.
//

import UIKit

protocol BreedInfoRoutingLogic {

}

protocol BreedInfoDataPassing {
  var dataStore: BreedInfoDataStore? { get }
}

final class BreedInfoRouter: BreedInfoRoutingLogic, BreedInfoDataPassing {

  // MARK: - Public Properties
  weak var viewController: BreedInfoViewController?
  var dataStore: BreedInfoDataStore?

  // MARK: - Private Properties

  //

  // MARK: - Routing Logic

  //

  // MARK: - Navigation

  //

  // MARK: - Passing data

  //
}
