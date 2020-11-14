//
//  PetAdding1stViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

protocol PetAdding1stDisplayLogic: AnyObject {
    func displayFetchedCategories(_ viewModel: PetAdding1stModels.FetchPetCategory.ViewModel)
}

final class PetAdding1stViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var nextButton: UIButton!
    
  
    // MARK: - Public Properties

    var interactor: PetAdding1stBusinessLogic?
    var router: (PetAdding1stRoutingLogic & PetAdding1stDataPassing)?

    // MARK: - Private Properties
    private var categories: [PetCategory]?
    
    
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
        requestToFetchCategories()
    }

    // MARK: - Public Methods


    // MARK: - Requests
    private func requestToFetchCategories() {
        let request = PetAdding1stModels.FetchPetCategory.Request()
        interactor?.fetchPetCategories(request)
    }
    
    private func requestToSelectCategory(by indexPath: IndexPath) {
        let request = PetAdding1stModels.SelectCategory.Request(index: indexPath.row)
        interactor?.selectCategory(request)
    }

    // MARK: - Private Methods
    private func setup() {
        let interactor = PetAdding1stInteractor()
        let presenter = PetAdding1stPresenter()
        let router = PetAdding1stRouter()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
  
    // MARK: - UI Actions
    @IBAction func didTapOnNext(_ sender: Any) {
        print("najal")
        router?.routeToPetAdding2nd()
    }
    
    
}

// MARK: - Display Logic

extension PetAdding1stViewController: PetAdding1stDisplayLogic {
    func displayFetchedCategories(_ viewModel: PetAdding1stModels.FetchPetCategory.ViewModel) {
        categories = viewModel.category
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension PetAdding1stViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCategoryCell", for: indexPath) as! PetCategoryCell
        let category = categories?[indexPath.row]
        cell.setup(cell: category!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        requestToSelectCategory(by: indexPath)
        print(indexPath)
    }
}
