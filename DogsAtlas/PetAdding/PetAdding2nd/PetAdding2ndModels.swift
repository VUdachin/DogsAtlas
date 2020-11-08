//
//  PetAdding2ndModels.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import UIKit

enum PetAdding2ndModels {
  
    // MARK: - Something
    enum FetchPet {
        struct Request {}
    
        struct Response {
            let category: PetCategory
        }
    
        struct ViewModel {
            let category: PetCategory
        }
    }
    
    enum CreatePet {
        struct Request {
            let pet: NewPet
        }
    
        struct Response {
            let pet: NewPet
        }
    }
    
}
