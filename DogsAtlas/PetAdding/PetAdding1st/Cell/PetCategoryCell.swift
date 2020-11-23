//
//  PetCategoryCell.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

class PetCategoryCell: UICollectionViewCell {
    
    @IBOutlet private weak var petCategoryImage: UIImageView!
    @IBOutlet private weak var name: UILabel! {
        didSet {
            name.isHidden = true
        }
    }
    
    func configure(cell: PetCategory) {
        //name.text = cell.categoryName ?? ""
        petCategoryImage.image = UIImage(named: cell.image!)
    }
}
