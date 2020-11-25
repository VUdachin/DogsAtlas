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
    
    @IBOutlet private weak var pickerView: UIPickerView!
    
    @IBOutlet private weak var breedButton: UIButton!
    @IBOutlet private weak var genderButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet weak var loadPhotoButton: UIButton!
    
    
    // MARK: - Public Properties

    var interactor: PetAdding2ndBusinessLogic?
    var router: (PetAdding2ndRoutingLogic & PetAdding2ndDataPassing)?

    // MARK: - Private Properties
    private var category: PetCategory?
    
    private var inputData: [String] = []
    private var breedList: [String] = ["a", "b", "c","d"] // need remove
    private let genderList: [String] = ["Male", "Female"] // need remove
    
    
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
        questionLabel.text = "What's your \(String(describing: category)) name?"
        
        setupPickerView()
        requestToFetchPet()
    }

    // MARK: - Public Methods


    // MARK: - Requests
    func requestToFetchPet() {
        let request = PetAdding2ndModels.FetchPet.Request()
        interactor?.fetchPet(request)
    }
    
    func requestToCreatePet() {
        let pet = NewPet(age: Int64(ageTextField.text!) ?? 0,
                           breed: breedButton.currentTitle,
                           gender: genderButton.currentTitle,
                           name: petNameTextField.text,
                           weight: Double(weightTextField.text!) ?? 0.0,
                           category: category)
        let request = PetAdding2ndModels.PreparePetData.Request(pet: pet)
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
    
    private func setupPickerView() {
        pickerView.isHidden = true
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }
  
    // MARK: - UI Actions
    @IBAction func didTapOnBreedButton(_ sender: Any) {
        inputData = breedList
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
    }
    
    @IBAction func didTapOnGenderButton(_ sender: Any) {
        inputData = genderList
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
    }
    
    @IBAction func didTapOnDoneButton(_ sender: Any) {
        requestToCreatePet()
        router?.routeToPhotoAdding()
    }
    
}

// MARK: - Display Logic
extension PetAdding2ndViewController: PetAdding2ndDisplayLogic {
    func displayFetchedPet(_ viewModel: PetAdding2ndModels.FetchPet.ViewModel) {
        self.category = viewModel.category
    }
}

// MARK: - Picker View
extension PetAdding2ndViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return inputData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return inputData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if inputData.count > 2 {
            breedButton.setTitle("\(inputData[row])", for: .normal)
        } else {
            genderButton.setTitle("\(inputData[row])", for: .normal)
        }
        self.pickerView.isHidden = true
    }
}

// MARK: - Text Field
extension PetAdding2ndViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
