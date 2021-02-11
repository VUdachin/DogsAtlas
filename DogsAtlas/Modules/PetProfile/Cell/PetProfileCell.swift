//
//  PetProfileCell.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 15.11.2020.
//

import UIKit

class PetProfileCell: UITableViewCell {
        
    @IBOutlet private weak var PetImageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var breedAndGenderLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    
    func configure(cell with: Pet) {
        PetImageView.image = UIImage(data: with.image!)
        nameLabel.text = with.name
        breedAndGenderLabel.text = "\(with.breed!) - \(with.gender!)"
        ageLabel.text = "Age \(with.age)"
        weightLabel.text = "Weight \(with.weight)kg"
    }
    
}
