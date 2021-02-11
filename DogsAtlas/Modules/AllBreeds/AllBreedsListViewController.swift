//
//  AllBreedsListViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 07.10.2020.
//

import UIKit

protocol AllBreedsListDisplayLogic: AnyObject {
    func displayFetchedBreeds(_ viewModel: AllBreedsListModels.FetchBreeds.ViewModel)
}

final class AllBreedsListViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Public Properties
    var interactor: AllBreedsListBusinessLogic?
    var router: (AllBreedsListRoutingLogic & AllBreedsListDataPassing)?

    // MARK: - Private Properties
    private var allDogs: Breeds = []

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
        setupCollectionView()
        requestToFetchBreeds()
    }

    // MARK: - Public Methods

    // MARK: - Requests
    private func requestToFetchBreeds() {
        let request = AllBreedsListModels.FetchBreeds.Request()
        interactor?.fetchBreeds(request)
    }
    
    private func requestToSelectedBreed(by indexPath: IndexPath) {
        let request = AllBreedsListModels.SelectBreed.Request(index: indexPath.row)
        interactor?.selectBreed(request)
    }
    

    // MARK: - Private Methods
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setup() {
        let interactor = AllBreedsListInteractor()
        let presenter = AllBreedsListPresenter()
        let router = AllBreedsListRouter()

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
extension AllBreedsListViewController: AllBreedsListDisplayLogic {
    func displayFetchedBreeds(_ viewModel: AllBreedsListModels.FetchBreeds.ViewModel) {
        allDogs = viewModel.breeds
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension AllBreedsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allDogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IdentifierBreedsCell", for: indexPath) as! BreedsCell
        cell.layer.cornerRadius = 12
        
        let dogs = allDogs[indexPath.row]
        cell.setup(cell: dogs)
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        requestToSelectedBreed(by: indexPath)
        router?.routeToBreedInfo()
    }
}
