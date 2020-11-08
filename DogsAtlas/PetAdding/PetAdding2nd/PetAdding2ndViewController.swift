//
//  PetAdding2ndViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding2ndDisplayLogic: AnyObject {
    func displayFetchedPet(_ viewModel: PetAdding2ndModels.FetchPet.ViewModel)
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
    private var category: PetCategory?
    
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
        requestToAddingData()
    }

    // MARK: - Public Methods


    // MARK: - Requests
    func requestToAddingData() {
        let request = PetAdding2ndModels.FetchPet.Request()
        interactor?.fetchPet(request)
    }
    
    func requestToCreatePet(pet: NewPet) {
        let request = PetAdding2ndModels.CreatePet.Request(pet: pet)
        interactor?.createPet(request)
    }

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
        let pet = NewPet(age: Int64(ageTextField.text!) ?? 0,
                           breed: breedButton.currentTitle,
                           gender: genderButton.currentTitle,
                           name: petNameTextField.text,
                           weight: Double(weightTextField.text!) ?? 0.0,
                           category: category)
        requestToCreatePet(pet: pet)
        
        router?.routeToPetProfile()
    }
    
}

// MARK: - Display Logic

extension PetAdding2ndViewController: PetAdding2ndDisplayLogic {
    func displayFetchedPet(_ viewModel: PetAdding2ndModels.FetchPet.ViewModel) {
        
    }
}
