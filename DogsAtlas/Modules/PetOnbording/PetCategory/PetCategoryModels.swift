//
//  PetCategoryModels.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import UIKit

enum PetCategoryModels {

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
