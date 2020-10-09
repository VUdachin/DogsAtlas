//
//  BreedInfoViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 09.10.2020.
//

import UIKit

protocol BreedInfoDisplayLogic: AnyObject {

}

final class BreedInfoViewController: UIViewController {

  // MARK: - UI Outlets
  
  //
  
  // MARK: - Public Properties

  var interactor: BreedInfoBusinessLogic?
  var router: (BreedInfoRoutingLogic & BreedInfoDataPassing)?

  // MARK: - Private Properties

    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
      let interactor = BreedInfoInteractor()
      let presenter = BreedInfoPresenter()
      let router = BreedInfoRouter()

      interactor.presenter = presenter
      presenter.viewController = self
      router.viewController = self
      router.dataStore = interactor

      self.interactor = interactor
      self.router = router
    }

  // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

  // MARK: - Public Methods
  
  //

  // MARK: - Requests
  
  //

  // MARK: - Private Methods

  
  
  // MARK: - UI Actions
  
  //
}

// MARK: - Display Logic

extension BreedInfoViewController: BreedInfoDisplayLogic {

}
