//
//  AllBreedsListRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 07.10.2020.
//

import UIKit

protocol AllBreedsListRoutingLogic {
    func routeToBreedInfo()
}

protocol AllBreedsListDataPassing {
  var dataStore: AllBreedsListDataStore? { get }
}

final class AllBreedsListRouter: AllBreedsListRoutingLogic, AllBreedsListDataPassing {

    // MARK: - Public Properties
    weak var viewController: AllBreedsListViewController?
    var dataStore: AllBreedsListDataStore?
  
    // MARK: - Private Properties
  
    // MARK: - Routing Logic
    func routeToBreedInfo() {
        guard
            let viewController = viewController,
            let storyboard = viewController.storyboard,
            let BreedInfoVC = storyboard.instantiateViewController(withIdentifier: "BreedInfoViewController") as? BreedInfoViewController,
            var BreedInfoDS = BreedInfoVC.router?.dataStore else {
            fatalError("Fail route to BreedInfo")
        }
            passDataToBreedInfo(destination: &BreedInfoDS)
            navigateToBreedInfo(destination: BreedInfoVC)
      }

    // MARK: - Navigation
    private func navigateToBreedInfo(destination: BreedInfoViewController) {
        viewController?.navigationController?.pushViewController(destination, animated: true)
      }

    // MARK: - Passing data
    private func passDataToBreedInfo(destination: inout BreedInfoDataStore) {
        destination.breed = dataStore?.selectedBreed
    }
}
