//
//  PetProfileCollectionReusableView.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 26.10.2020.
//

import UIKit

class PetProfileCollectionReusableView: UICollectionReusableView {

    @IBOutlet private weak var petNameLabel: UILabel!
    @IBOutlet private weak var breedGenderNameLabel: UILabel!
    @IBOutlet private weak var petImageView: UIImageView!
    
    @IBOutlet private weak var petPageControl: UIPageControl! // Later
}
