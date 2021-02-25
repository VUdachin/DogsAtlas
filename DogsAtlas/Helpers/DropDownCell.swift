//
//  DropDownCell.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 25.02.2021.
//

import UIKit

class DropDownCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - Setup UI
    private func setupSubview() {
        contentView.addSubview(titleLabel)
    }
    
    private func setupCell() {
        setupSubview()
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    
        ])
    }
    
    //MARK: - Public Methods
    func configure(with category: PetCategory) {
        //categoryImage.image = UIImage(named: category.image!)
    }
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
