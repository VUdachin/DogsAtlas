//
//  PetProfileReusableView.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 14.11.2020.
//

import UIKit

class PetProfileReusableView: UICollectionReusableView {
        
    @IBOutlet private weak var PetImageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var breedAndGenderLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    
    func configure(cell with: Pet) {
        
    }
    
}
