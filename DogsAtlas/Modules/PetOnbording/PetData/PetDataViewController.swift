//
//  PetDataViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

protocol PetDataDisplayLogic: AnyObject {
    func displayFetchedPet(_ viewModel: PetDataModels.FetchPet.ViewModel)
}

final class PetDataViewController: UIViewController {

    // MARK: - UI Outlets
    private lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        label.text = "Step 2 of 3"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        label.numberOfLines = 0
        label.text = "Tell us about your dog"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.numberOfLines = 0
        label.text = "What is your pet name?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.numberOfLines = 0
        label.text = "Age"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.numberOfLines = 0
        label.text = "Weight"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var sexLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.numberOfLines = 0
        label.text = "Sex"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sexButton: UIButton = {
        let button = UIButton()
        button.setTitle("Male", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(didTapSexButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Добавить Picker View или сделать кнопку с вариантами выбора без него
    
  
    // MARK: - Public Properties

    var interactor: PetDataBusinessLogic?
    var router: (PetDataRoutingLogic & PetDataDataPassing)?

    // MARK: - Private Properties
    private var category: PetCategory?
    
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
        setupView()
        requestToFetchPet()
    }

    // MARK: - Public Methods


    // MARK: - Requests
    func requestToFetchPet() {
        let request = PetDataModels.FetchPet.Request()
        interactor?.fetchPet(request)
    }
    
    func requestToCreatePet() {
        let pet = NewPet(age: Int64(ageTextField.text!) ?? 0,
                           sex: sexButton.currentTitle,
                           name: nameTextField.text,
                           weight: Double(weightTextField.text!) ?? 0.0,
                           category: category)
        let request = PetDataModels.PreparePetData.Request(pet: pet)
        interactor?.createPet(request)
    }
    
    

    // MARK: - Private Methods
    private func setup() {
        let interactor = PetDataInteractor()
        let presenter = PetDataPresenter()
        let router = PetDataRouter()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
    }
    
    private func setupSubviews() {
        view.addSubview(questionLabel)
        view.addSubview(stepLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(sexLabel)
        view.addSubview(sexButton)
        view.addSubview(nextButton)
        view.addSubview(weightLabel)
        view.addSubview(weightTextField)
    }
    
    private func setupView() {
        setupSubviews()
        let safeArea = view.safeAreaLayoutGuide
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            
            stepLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: inset),
            stepLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            stepLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            
            questionLabel.topAnchor.constraint(equalTo: stepLabel.bottomAnchor, constant: inset),
            questionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: inset),
            questionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: -inset),
            
            nameLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: inset),
            nameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: inset),
            nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: -inset),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: inset),
            nameTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: -inset),
            
            ageLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            ageLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: inset),
            ageLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: -inset),
            
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
            ageTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: inset),
            ageTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: -inset),
            
            weightLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 8),
            weightLabel.trailingAnchor.constraint(equalTo: ageTextField.trailingAnchor, constant: inset),
            weightLabel.leadingAnchor.constraint(equalTo: ageTextField.leadingAnchor, constant: -inset),
            
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 8),
            weightTextField.trailingAnchor.constraint(equalTo: weightLabel.trailingAnchor, constant: inset),
            weightTextField.leadingAnchor.constraint(equalTo: weightLabel.leadingAnchor, constant: -inset),
            
            sexLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 8),
            sexLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: inset),
            sexLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: -inset),
            
            sexButton.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 8),
            sexButton.heightAnchor.constraint(equalToConstant: 60),
            sexButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: inset),
            sexButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: -inset),
            
            nextButton.topAnchor.constraint(equalTo: sexButton.bottomAnchor, constant: 8),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: inset),
            nextButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: -inset),
            //nextButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: inset),
            
            view.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: inset)
        ])
    }
  
    // MARK: - UI Actions
    @objc private func didTapSexButton() {

    }
    
    @objc private func didTapNextButton() {
        requestToCreatePet()
        router?.routeToPhotoAdding()
    }
    
}

// MARK: - Display Logic
extension PetDataViewController: PetDataDisplayLogic {
    func displayFetchedPet(_ viewModel: PetDataModels.FetchPet.ViewModel) {
        self.category = viewModel.category
    }
}

// MARK: - Text Field
extension PetDataViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
