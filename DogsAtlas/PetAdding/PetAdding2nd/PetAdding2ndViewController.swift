//
//  PetAdding2ndViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding2ndDisplayLogic: AnyObject {

}

final class PetAdding2ndViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet private weak var questionLabel: UILabel!
    
    @IBOutlet private weak var petNameTextField: UITextField!
    @IBOutlet private weak var ageTextField: UITextField!
    @IBOutlet private weak var weightTextField: UITextField!
    
    @IBOutlet private weak var breedButton: UIButton!
    @IBOutlet private weak var genderButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    
    // MARK: - Public Properties

    var interactor: PetAdding2ndBusinessLogic?
    var router: (PetAdding2ndRoutingLogic & PetAdding2ndDataPassing)?

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
        let interactor = PetAdding2ndInteractor()
        let presenter = PetAdding2ndPresenter()
        let router = PetAdding2ndRouter()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
    }
  
    // MARK: - UI Actions
    @IBAction func didTapOnBreedButton(_ sender: Any) {
    }
    
    @IBAction func didTapOnGenderButton(_ sender: Any) {
    }
    
    @IBAction func didTapOnDoneButton(_ sender: Any) {
    }
    
}

// MARK: - Display Logic

extension PetAdding2ndViewController: PetAdding2ndDisplayLogic {

}
