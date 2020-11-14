//
//  PetProfileViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 26.10.2020.
//

import UIKit
import CoreData

protocol PetProfileDisplayLogic: AnyObject {
    func displayFetchedPets(_ viewModel: PetProfileModels.FetchPets.ViewModel)
}

final class PetProfileViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var petImageView: UIImageView!
    @IBOutlet private weak var petNameLabel: UILabel!
    @IBOutlet private weak var breedLabel: UILabel!
    
    // MARK: - Public Properties
    var interactor: PetProfileBusinessLogic?
    var router: (PetProfileRoutingLogic & PetProfileDataPassing)?

    // MARK: - Private Properties
    private var fetchedPets: [NSManagedObject] = []
    
    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let interactor = PetProfileInteractor()
        let presenter = PetProfilePresenter()
        let router = PetProfileRouter()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
    }
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        requestToFetchPets()
    }

    // MARK: - Public Methods


    // MARK: - Requests
    private func requestToFetchPets() {
        let request = PetProfileModels.FetchPets.Request()
        interactor?.fetchPets(request)
    }

    // MARK: - Private Methods
    private func setupCollectionView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    // MARK: - UI Actions
  
}

// MARK: - Display Logic

extension PetProfileViewController: PetProfileDisplayLogic {
    func displayFetchedPets(_ viewModel: PetProfileModels.FetchPets.ViewModel) {
        fetchedPets = viewModel.pets
    }
}

extension PetProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetActionsCell", for: indexPath) as! PetActionsCell
        
        return cell
    }
    
    
    
    
}
