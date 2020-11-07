//
//  PetAdding1stModels.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

enum PetAdding1stModels {
  
    // MARK: - Fetch categories
    enum FetchPetCategory {
        struct Request {}
    
        struct Response {
            let category: [PetCategory]
        }
    
        struct ViewModel {
            let category: [PetCategory]
        }
    }

    // MARK: - Select category by index
    enum SelectCategory {
        struct Request {
            let index: Int
        }
    }
}
    
