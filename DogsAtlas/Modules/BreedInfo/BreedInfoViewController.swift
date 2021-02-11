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
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    @IBOutlet private weak var breedNameLabel: UILabel!
    @IBOutlet private weak var lifeSpanLabel: UILabel!
    @IBOutlet private weak var temperamentLabel: UILabel!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    
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
        requestToFetchBreeds()
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
        let breed = viewModel.breed
        
        breedNameLabel.text = breed.name
        lifeSpanLabel.text = "Life span: " + breed.lifeSpan
        temperamentLabel.text = breed.temperament
        heightLabel.text = "Height: " + breed.height.metric
        weightLabel.text = "Weight: " + breed.weight.metric
        
        backgroundImageView.downloadFrom(imageUrl: viewModel.image[0].url)
    }
}
