//
//  PetProfileModels.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 26.10.2020.
//

import UIKit
import CoreData

enum PetProfileModels {
  
  // MARK: - FetchPets
  
  enum FetchPets {
    struct Request {}
    
    struct Response {
        //var pets: Pet
        var pets: [NSManagedObject]
    }
    
    struct ViewModel {
        //var pets: Pet
        var pets: [NSManagedObject]
    }
  }
}
