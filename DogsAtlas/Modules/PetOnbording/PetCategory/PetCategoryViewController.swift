//
//  PetCategoryViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

protocol PetCategoryDisplayLogic: AnyObject {
    func displayFetchedCategories(_ viewModel: PetCategoryModels.FetchPetCategory.ViewModel)
}

final class PetCategoryViewController: UIViewController {

    // MARK: - UI Outlets
    private lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        label.text = "Step 1 of 3"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        label.numberOfLines = 0
        label.text = "Choose your pet"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView()
        return cv
    }()
    

    
    // MARK: - Public Properties

    var interactor: PetCategoryBusinessLogic?
    var router: (PetCategoryRoutingLogic & PetCategoryDataPassing)?

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
        let request = PetCategoryModels.FetchPetCategory.Request()
        interactor?.fetchPetCategories(request)
    }
    
    private func requestToSelectCategory(by indexPath: IndexPath) {
        let request = PetCategoryModels.SelectCategory.Request(index: indexPath.row)
        interactor?.selectCategory(request)
    }

    // MARK: - Private Methods
    private func setup() {
        let interactor = PetCategoryInteractor()
        let presenter = PetCategoryPresenter()
        let router = PetCategoryRouter()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
    }
    
    private func setupView() {
        let safeArea = view.safeAreaLayoutGuide
        let inset: CGFloat = 12
        
        setupCollectionView()
        
        view.addSubview(collectionView)
        view.addSubview(questionLabel)
        view.addSubview(stepLabel)
        
        NSLayoutConstraint.activate([
            
            stepLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: inset),
            stepLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            stepLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            
            questionLabel.topAnchor.constraint(equalTo: stepLabel.bottomAnchor, constant: inset),
            questionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: inset),
            questionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: -inset),
            
            collectionView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width / 2, height: UIScreen.main.bounds.size.width / 3)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
  
    // MARK: - UI Actions

    
}

// MARK: - Display Logic
extension PetCategoryViewController: PetCategoryDisplayLogic {
    func displayFetchedCategories(_ viewModel: PetCategoryModels.FetchPetCategory.ViewModel) {
        categories = viewModel.category
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension PetCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell,
              let category = categories?[indexPath.row] else {
            fatalError("Could not instantiate CategoryCell.")
        }
        cell.configure(with: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        requestToSelectCategory(by: indexPath)
        router?.routeToPetAdding2nd()
    }
}
