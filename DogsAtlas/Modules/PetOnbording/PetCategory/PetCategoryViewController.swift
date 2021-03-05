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
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()

    // MARK: - Public Properties
    var interactor: PetCategoryBusinessLogic?
    var router: (PetCategoryRoutingLogic & PetCategoryDataPassing)?

    // MARK: - Private Properties
    private var categories: [PetCategory]?

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
    private func setupView() {
        view.backgroundColor = .white

        let safeArea = view.safeAreaLayoutGuide

        setupCollectionView()
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)

        ])
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 30, left: 15, bottom: 30, right: 15)
        layout.minimumLineSpacing = 60
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 2 - 20, height: UIScreen.main.bounds.size.width / 3 - 20)
        layout.headerReferenceSize = CGSize(width: (UIScreen.main.bounds.size.width), height: 100)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        collectionView.register(OnboardingPetHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OnboardingPetHeaderView.reuseIdentifier)

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
        return categories?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell,
              let category = categories?[indexPath.row] else {
            fatalError("Could not instantiate CategoryCell.")
        }
        cell.configure(with: category)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: OnboardingPetHeaderView.reuseIdentifier, for: indexPath) as? OnboardingPetHeaderView else {
            fatalError("Could not instantiate Header.")
        }
        headerView.backgroundColor = .white
        headerView.configure(header: Stage.category)
        return headerView
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        requestToSelectCategory(by: indexPath)
        router?.routeToPetData()
    }
}

extension PetCategoryViewController: UIPopoverPresentationControllerDelegate {

}
