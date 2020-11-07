//
//  PetCategoryCell.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

class PetCategoryCell: UICollectionViewCell {
    
    @IBOutlet private weak var petCategoryImage: UIImageView!
    @IBOutlet private weak var name: UILabel!
    
    func setup(cell: PetCategory) {
        name.text = cell.categoryName ?? ""
    }
}
