//
//  PhotoAddingViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 23.11.2020.
//

import UIKit

protocol PhotoAddingDisplayLogic: AnyObject {
    func displayFetchedPrepairedData(_ viewModel: PhotoAddingModels.FetchPetData.ViewModel)
}

final class PhotoAddingViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet private  weak var photoImageView: UIImageView!
    
    @IBOutlet private weak var addPhotoButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    
    // MARK: - Public Properties

    var interactor: PhotoAddingBusinessLogic?
    var router: (PhotoAddingRoutingLogic & PhotoAddingDataPassing)?

    // MARK: - Private Properties
    private var selectedPhoto: Data?
    
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
        requestToFetchPrepairedData()
    }

    // MARK: - Public Methods
    

    // MARK: - Requests
    private func requestToFetchPrepairedData() {
        let request = PhotoAddingModels.FetchPetData.Request()
        interactor?.fetchPrepairedData(request)
    }
    
    private func requestToLoadPhoto() {
        
    }
    
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
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
    }
    
    @IBAction func didDoneTap(_ sender: UIButton) {
        requestToCreatePet(with: selectedPhoto!)
        router?.routeToPetProfile()
        print("okkkkkk")
    }
    
}

// MARK: - Display Logic

extension PhotoAddingViewController: PhotoAddingDisplayLogic {
    func displayFetchedPrepairedData(_ viewModel: PhotoAddingModels.FetchPetData.ViewModel) {
        
    }
}

// MARK: - Image Picker
extension PhotoAddingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? Data else {
            return
        }
        selectedPhoto = image
        photoImageView.image = UIImage(data: image)
    }
    
    
}
