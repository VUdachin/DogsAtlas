//
//  BreedInfoModels.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 09.10.2020.
//

import UIKit

enum BreedInfoModels {
  
  // MARK: -  FetchBreedInfo
  
  enum FetchBreedInfo {
    struct Request {}
    
    struct Response {
        var breed: Breed
        var image: BreedImages
    }
    
    struct ViewModel {
        var breed: Breed
        var image: BreedImages
    }
  }
}
