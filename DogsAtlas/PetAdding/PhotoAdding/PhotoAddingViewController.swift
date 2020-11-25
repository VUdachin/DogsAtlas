//
//  PhotoAddingViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 23.11.2020.
//

import UIKit

protocol PhotoAddingDisplayLogic: AnyObject {

}

final class PhotoAddingViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet private weak var photoImageView: UIImageView!
    
    @IBOutlet private weak var addPhotoButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    
    // MARK: - Public Properties

    var interactor: PhotoAddingBusinessLogic?
    var router: (PhotoAddingRoutingLogic & PhotoAddingDataPassing)?

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
    private func requestToCreatePet(with img: Data) {
        let request = PhotoAddingModels.CreatePet.Request(image: img)
        interactor?.createPet(request: request)
    }

    // MARK: - Private Methods
    private func setup() {
        let interactor = PhotoAddingInteractor()
        let presenter = PhotoAddingPresenter()
        let router = PhotoAddingRouter()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
    }
  
    // MARK: - UI Actions
    @IBAction func didAddPhotoTap(_ sender: UIButton) {
        alertForPickerController()
    }
    
    @IBAction func didDoneTap(_ sender: UIButton) {
        requestToCreatePet(with: (photoImageView.image?.pngData())!)
        router?.routeToPetProfile()
    }
    
}

// MARK: - Display Logic

extension PhotoAddingViewController: PhotoAddingDisplayLogic {

}

// MARK: - Image Picker
extension PhotoAddingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
