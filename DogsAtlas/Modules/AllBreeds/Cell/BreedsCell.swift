//
//  BreedsCell.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 04.10.2020.
//

import UIKit

class BreedsCell: UICollectionViewCell {

    let identifier = "IdentifierBreedsCell"

    // MARK: - IBOutlets
    @IBOutlet private weak var breedsImageView: UIImageView!
    @IBOutlet private weak var breedsNameLabel: UILabel!

    func setup(cell: Breed) {
        breedsImageView.image = nil // PLUG
        breedsNameLabel.text = cell.name
    }
}
