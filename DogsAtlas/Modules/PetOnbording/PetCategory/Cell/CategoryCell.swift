//
//  CategoryCell.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static var reuseIdentifier = "PetCategoryCell"
    
    //MARK: - Create UI
    private lazy var categoryImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - Setup UI
    private func setupSubview() {
        contentView.addSubview(categoryImage)
    }
    
    private func setupCell() {
        setupSubview()
        
        NSLayoutConstraint.activate([
            
            categoryImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            categoryImage.heightAnchor.constraint(equalTo: contentView.heightAnchor)
    
        ])
    }
    
    //MARK: - Public Methods
    func configure(with category: PetCategory) {
        categoryImage.image = UIImage(named: category.image!)
    }
    
    //MARK: - init
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupCell()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
