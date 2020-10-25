//
//  BreedInfoViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 09.10.2020.
//

import UIKit

protocol BreedInfoDisplayLogic: AnyObject {
    func displayFetchedBreedInfo(_ viewModel: BreedInfoModels.FetchBreedInfo.ViewModel)
}

final class BreedInfoViewController: UIViewController {

  // MARK: - UI Outlets
  
  //
  
  // MARK: - Public Properties
    var interactor: BreedInfoBusinessLogic?
    var router: (BreedInfoRoutingLogic & BreedInfoDataPassing)?

  // MARK: - Private Properties
    private var breed: Breed?
    private var image: String?
    
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
    private func requestToFetchBreeds() {
        let request = BreedInfoModels.FetchBreedInfo.Request()
        interactor?.fetchBreedInfo(request)
    }
  //

  // MARK: - Private Methods

  
  
  // MARK: - UI Actions
  
  //
}

// MARK: - Display Logic

extension BreedInfoViewController: BreedInfoDisplayLogic {
    func displayFetchedBreedInfo(_ viewModel: BreedInfoModels.FetchBreedInfo.ViewModel) {
        breed = viewModel.breed
        image = viewModel.image.url
    }
}
