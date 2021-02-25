//
//  PetPhotoViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 22.02.2021.
//

import UIKit

protocol PetPhotoDisplayLogic: AnyObject {

}

final class PetPhotoViewController: UIViewController {

    // MARK: - UI Outlets
    private lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .purple
        label.numberOfLines = 0
        label.text = "Step 3 of 3"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        label.numberOfLines = 0
        label.text = "Add your pet's photo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "dog")
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var addPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add photo", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(didAddPhotoTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var createPetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add your pet's profile!", for: .normal)
        button.addTarget(self, action: #selector(didCreatePetTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
  
    // MARK: - Public Properties
    var interactor: PetPhotoBusinessLogic?
    var router: (PetPhotoRoutingLogic & PetPhotoDataPassing)?

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
    }

    // MARK: - Requests
    private func requestToCreatePet(with img: Data) {
        let request = PetPhotoModels.CreatePet.Request(image: img)
        interactor?.createPet(request: request)
    }

    // MARK: - Private Methods
    private func setupSubView() {
        view.addSubview(stepLabel)
        view.addSubview(questionLabel)
        view.addSubview(photoImageView)
        view.addSubview(addPhotoButton)
        view.addSubview(createPetButton)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupSubView()
        
        let safeArea = view.safeAreaLayoutGuide
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            
            stepLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: inset),
            stepLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),
            stepLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            
            questionLabel.topAnchor.constraint(equalTo: stepLabel.bottomAnchor, constant: inset),
            questionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            questionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),
            
            //photoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            photoImageView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: inset),
            photoImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            photoImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),
            
            addPhotoButton.heightAnchor.constraint(equalToConstant: 60),
            addPhotoButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            addPhotoButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),
            
            createPetButton.heightAnchor.constraint(equalToConstant: 60),
            createPetButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: inset),
            createPetButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            createPetButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),
            
            safeArea.bottomAnchor.constraint(equalTo: createPetButton.bottomAnchor, constant: inset)
        ])
        
    }
  
    // MARK: - UI Actions
    @objc private func didAddPhotoTap() {
        alertForPickerController()
    }
    
    @objc private func didCreatePetTap() {
        requestToCreatePet(with: (photoImageView.image?.pngData())!)
        router?.routeToPetProfile()
    }
    
}

// MARK: - Display Logic

extension PetPhotoViewController: PetPhotoDisplayLogic {

}

extension PetPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func alertForPickerController() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            self.showImagePickerController(sourceType: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = sourceType
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            photoImageView.image = editedImage
        } else if let originaImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = originaImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}
