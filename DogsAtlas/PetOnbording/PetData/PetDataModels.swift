//
//  PetDataModels.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

enum PetDataModels {
  
    enum FetchPet {
        struct Request {}
    
        struct Response {
            let category: PetCategory
        }
    
        struct ViewModel {
            let category: PetCategory
        }
    }
    
    enum PreparePetData {
        struct Request {
            let pet: NewPet
        }
    
        struct Response {
            let pet: NewPet
        }
    }
    
    enum LoadPhoto {
        struct Request {
            let photo: Data
        }
    
        struct Response {
            let photo: Data
        }
    }
}
