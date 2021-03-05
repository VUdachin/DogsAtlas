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
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .purple
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
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        label.text = "What is your pet name?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here"
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        label.text = "Age"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here"
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        label.text = "Weight"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here"
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var sexLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        label.text = "Sex"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var sexButton: UIButton = {
        let button = UIButton()
        button.setTitle("Male", for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(didTapSexButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
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
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        requestToFetchPet()
    }

    // MARK: - Public Methods
    func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

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
        view.backgroundColor = .white

        setupSubviews()
        let safeArea = view.safeAreaLayoutGuide
        let inset: CGFloat = 12
        let insetSeparator: CGFloat = 16

        NSLayoutConstraint.activate([

            stepLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: inset),
            stepLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),
            stepLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),

            questionLabel.topAnchor.constraint(equalTo: stepLabel.bottomAnchor, constant: inset),
            questionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            questionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),

            nameLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: inset),
            nameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),

            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: inset),
            nameTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            nameTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),

            ageLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: insetSeparator),
            ageLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            ageLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),

            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: inset),
            ageTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            ageTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),

            weightLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: insetSeparator),
            weightLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            weightLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),

            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: inset),
            weightTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            weightTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),

            sexLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: insetSeparator),
            sexLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            sexLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),

            sexButton.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: inset),
            sexButton.heightAnchor.constraint(equalToConstant: 40),
            sexButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            sexButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),

            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            nextButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),

            safeArea.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: inset)
        ])
    }

    // MARK: - UI Actions
    @objc private func didTapSexButton() {

    }

    @objc private func didTapNextButton() {
        requestToCreatePet()
        router?.routeToPetPhoto()
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
