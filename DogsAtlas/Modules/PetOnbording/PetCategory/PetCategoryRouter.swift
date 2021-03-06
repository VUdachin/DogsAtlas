//
//  PetCategoryRouter.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

protocol PetCategoryRoutingLogic {
    func routeToPetData()
    func showPopOver(sender: UIButton, with data: [String])
}

protocol PetCategoryDataPassing {
    var dataStore: PetCategoryDataStore? { get }
}

final class PetCategoryRouter: PetCategoryRoutingLogic, PetCategoryDataPassing {

    // MARK: - Public Properties
    weak var viewController: PetCategoryViewController?
    var dataStore: PetCategoryDataStore?

    // MARK: - Private Properties
    func routeToPetData() {
            let petDataVC = PetDataConfigurator.createScene()
            var petDataDS = petDataVC.router?.dataStore
        passDataToPetData(destination: &(petDataDS)!)
        navigateToPetData(destination: petDataVC)
    }

    func showPopOver(sender: UIButton, with data: [String]) {
        let popOverVC = PopOverViewController()
        popOverVC.modalPresentationStyle = .popover
        popOverVC.data = data

        if let popOver = popOverVC.popoverPresentationController {
            popOver.delegate = viewController
            popOver.permittedArrowDirections = .down
            popOver.sourceView = sender
            popOver.sourceRect = sender.bounds

            popOverVC.preferredContentSize = CGSize(width: 200, height: 200)
            viewController?.present(popOverVC, animated: true)
        }

    }

    // MARK: - Navigation
    private func navigateToPetData(destination: PetDataViewController) {
        destination.modalPresentationStyle = .fullScreen
        viewController?.present(destination, animated: true)
    }

    // MARK: - Passing data
    private func passDataToPetData(destination: inout PetDataDataStore) {
        destination.category = dataStore?.selectedCategory
    }

}

extension PetCategoryViewController: UIPopoverPresentationControllerDelegate {

 }
