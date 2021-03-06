//
//  PetProfileHeaderView.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 27.02.2021.
//

import UIKit

class PetProfileHeaderCell: UICollectionViewCell {
    static let reuseIdentifier = "PetProfileHeader"

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()

    private var pets: [Pet]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(pet: [Pet]) {
        pets = pet
    }

    @objc private func editProfile() {
        // route to profile editor
    }

    private func setupView() {
        setupSubView()
        setupCollectionView()

        let safeArea = self.safeAreaLayoutGuide
        let inset: CGFloat = 12

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: inset)

        ])
    }

    private func setupSubView() {
        self.addSubview(collectionView)
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AvatarCell.self, forCellWithReuseIdentifier: AvatarCell.reuseIdentifier)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension PetProfileHeaderCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvatarCell.reuseIdentifier, for: indexPath) as? AvatarCell,
              let pet = pets?[indexPath.row] else {
            fatalError("Could not init HeaderAvatarCell")
        }
        cell.configure(with: pet)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
    }

}
