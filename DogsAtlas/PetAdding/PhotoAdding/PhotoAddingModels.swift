//
//  PhotoAddingModels.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 23.11.2020.
//

import UIKit

enum PhotoAddingModels {
  
    // MARK: - Something
    enum FetchPetData {
        struct Request {
            var data: NewPet?
        }
    
        struct Response {
            var data: NewPet?
        }
    
        struct ViewModel {
            var data: NewPet?
        }
    }
    
    enum CreatePet {
        struct Request {
            let image: Data?
        }
    
        struct Response {}
    
        struct ViewModel {}
    }
}
