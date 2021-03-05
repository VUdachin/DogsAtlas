//
//  PetModel.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 07.11.2020.
//

import Foundation
import UIKit

struct NewPet {
    var age: Int64
//    var breed: String?
    var sex: String?
    var name: String?
    var weight: Double
    var apointments: NSSet?
    var category: PetCategory?
    var image: Data?
}
