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
        struct Request {}
    
        struct Response {}
    
        struct ViewModel {}
    }
    
    enum CreatePet {
        struct Request {
            let image: Data?
        }
    
        struct Response {}
    
        struct ViewModel {}
    }
}
