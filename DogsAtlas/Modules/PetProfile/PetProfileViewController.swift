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
    private var fetchedPets: [NSManagedObject]? {
        didSet {
            self.collectionView.reloadData()
        }
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
        view.backgroundColor = .white
        
        setupCollectionView()
        view.addSubview(collectionView)

        let safeArea = view.safeAreaLayoutGuide

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
        layout.minimumLineSpacing = 30
        

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: ScheduleCell.reuseIdentifier)
        collectionView.register(PetProfileHeaderCell.self, forCellWithReuseIdentifier: PetProfileHeaderCell.reuseIdentifier)

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
        }
    }
}

extension PetProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetProfileHeaderCell.reuseIdentifier, for: indexPath) as? PetProfileHeaderCell else {
                fatalError("Could not init HeaderCell")
            }
            let pet = fetchedPets as! [Pet]
            cell.configure(pet: pet)
            return cell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleCell.reuseIdentifier, for: indexPath) as? ScheduleCell else {
            fatalError("Could not init HeaderCell")
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: UIScreen.main.bounds.size.width / 3 - 20, height: 200)
        }
        return CGSize(width: view.frame.width - 30, height: UIScreen.main.bounds.size.height * 0.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
    }
    
}
