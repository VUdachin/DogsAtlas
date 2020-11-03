//
//  PetAdding1stViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding1stDisplayLogic: AnyObject {

}

final class PetAdding1stViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var nextButton: UIButton!
    
  
    // MARK: - Public Properties

    var interactor: PetAdding1stBusinessLogic?
    var router: (PetAdding1stRoutingLogic & PetAdding1stDataPassing)?

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

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Public Methods


    // MARK: - Requests


    // MARK: - Private Methods
    private func setup() {
        let interactor = PetAdding1stInteractor()
        let presenter = PetAdding1stPresenter()
        let router = PetAdding1stRouter()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
    }
  
    // MARK: - UI Actions
    @IBAction func didTapOnNext(_ sender: Any) {
        
    }
    
    
}

// MARK: - Display Logic

extension PetAdding1stViewController: PetAdding1stDisplayLogic {

}
