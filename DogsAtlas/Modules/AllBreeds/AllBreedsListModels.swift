//
//  AllBreedsListModels.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 07.10.2020.
//

import UIKit

enum AllBreedsListModels {
  
  // MARK: - Fetch list of breeds

    enum FetchBreeds {
        struct Request {}
    
        struct Response {
            let breeds: Breeds
        }
    
        struct ViewModel {
            let breeds: Breeds
        }
    }
    
    // MARK: - Select breed by index
    enum SelectBreed {
        struct Request {
            let index: Int
        }
    }
}
