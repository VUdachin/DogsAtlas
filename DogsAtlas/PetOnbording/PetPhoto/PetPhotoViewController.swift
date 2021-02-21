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
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        label.text = "Step 3 of 3"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        label.numberOfLines = 0
        label.text = "Add your pet photo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        //image.image = UIImage(named: <#T##String#>)
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var createPetButton: UIButton = {
        let button = UIButton()
        return button
    }()
  
    // MARK: - Public Properties

    var interactor: PetPhotoBusinessLogic?
    var router: (PetPhotoRoutingLogic & PetPhotoDataPassing)?

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
        let interactor = PetPhotoInteractor()
        let presenter = PetPhotoPresenter()
        let router = PetPhotoRouter()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
    }
  
    // MARK: - UI Actions

    
}

// MARK: - Display Logic

extension PetPhotoViewController: PetPhotoDisplayLogic {

}
