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
        setupTableView()
        requestToFetchPets()
    }

    // MARK: - Public Methods


    // MARK: - Requests
    private func requestToFetchPets() {
        let request = PetProfileModels.FetchPets.Request()
        interactor?.fetchPets(request)
    }

    // MARK: - Private Methods
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    // MARK: - UI Actions
  
}

// MARK: - Display Logic

extension PetProfileViewController: PetProfileDisplayLogic {
    func displayFetchedPets(_ viewModel: PetProfileModels.FetchPets.ViewModel) {
        fetchedPets = viewModel.pets
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension PetProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedPets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pet = fetchedPets[0] as! Pet
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "PetProfileCell", for: indexPath) as! PetProfileCell
        profileCell.configure(cell: pet)
        return profileCell
    }
    
    
    
}
