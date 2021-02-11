//
//  PetActionCell.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 14.11.2020.
//

import UIKit

class PetActionsCell: UITableViewCell {
    
    @IBOutlet private weak var actionLabel: UILabel!
    
    func configure(cell with: Apointments) {
        actionLabel.text = "Test"
    }
}
