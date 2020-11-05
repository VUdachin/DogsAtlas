//
//  PetAdding1stModels.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

enum PetAdding1stModels {
  
    // MARK: - Something
    enum FetchPetCategory {
        struct Request {}
    
        struct Response {
            let category: [PetCategory]
        }
    
        struct ViewModel {
            let category: [PetCategory]
        }
    }
}
