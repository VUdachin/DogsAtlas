//
//  PetProfileHeaderView.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 27.02.2021.
//

import UIKit

class PetProfileHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "PetProfileHeader"
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit profile", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private var pets = [Pet]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
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
            collectionView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: inset), // ??
            
            nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),
            
            editProfileButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: inset),
            editProfileButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),
            
            safeArea.bottomAnchor.constraint(equalTo: editProfileButton.bottomAnchor, constant: -inset)
        ])
    }
    
    private func setupSubView() {
        self.addSubview(collectionView)
        self.addSubview(nameLabel)
        self.addSubview(editProfileButton)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.sectionInset = UIEdgeInsets(top: 30, left: 15, bottom: 30, right: 15)
        layout.minimumLineSpacing = 60
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 3 - 20, height: UIScreen.main.bounds.size.width / 3 - 20) // set height
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HeaderAvatarCell.self, forCellWithReuseIdentifier: HeaderAvatarCell.reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
}

extension PetProfileHeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderAvatarCell.reuseIdentifier, for: indexPath) as! HeaderAvatarCell
        let pet = pets[indexPath.row]
        cell.configure(with: pet)
        return cell
    }
    
    
}
