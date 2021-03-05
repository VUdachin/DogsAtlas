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
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()

    // MARK: - Public Properties
    var interactor: PetProfileBusinessLogic?
    var router: (PetProfileRoutingLogic & PetProfileDataPassing)?

    // MARK: - Private Properties
    private var fetchedPets = [NSManagedObject]()

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
        requestToFetchPets()
    }

    // MARK: - Public Methods

    // MARK: - Requests
    private func requestToFetchPets() {
        let request = PetProfileModels.FetchPets.Request()
        interactor?.fetchPets(request)
    }

    // MARK: - Private Methods

    private func setupView() {
        setupCollectionView()
        setupSubViews()

        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)

        ])
    }

    private func setupSubViews() {
        view.addSubview(collectionView)

    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 30, left: 15, bottom: 30, right: 15)
        layout.minimumLineSpacing = 60
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 2 - 20, height: UIScreen.main.bounds.size.width / 3 - 20)
        layout.headerReferenceSize = CGSize(width: (UIScreen.main.bounds.size.width), height: 200)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: ScheduleCell.reuseIdentifier)
        collectionView.register(PetProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PetProfileHeaderView.reuseIdentifier)

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    // MARK: - UI Actions

}

// MARK: - Display Logic

extension PetProfileViewController: PetProfileDisplayLogic {
    func displayFetchedPets(_ viewModel: PetProfileModels.FetchPets.ViewModel) {
        DispatchQueue.main.async {
            self.fetchedPets = viewModel.pets
            self.collectionView.reloadData()
        }
    }
}

extension PetProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedPets.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleCell.reuseIdentifier, for: indexPath) as? ScheduleCell else {
            fatalError("Could not instantiate Schedule Cell.")
        }
//        cell.configure(with: <#T##Pet#>) //shedule configure, need shedule model
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PetProfileHeaderView.reuseIdentifier, for: indexPath) as? PetProfileHeaderView else {
            fatalError("Could not instantiate Header.")
        }

        let pets = fetchedPets as! [Pet]
        headerView.backgroundColor = .white
        headerView.configure(pet: pets)
        return headerView
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

}
