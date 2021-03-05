//
//  PetPhotoModels.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 22.02.2021.
//

import UIKit

enum PetPhotoModels {

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
