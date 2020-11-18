//
//  PetCategory+CoreDataProperties.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 18.11.2020.
//
//

import Foundation
import CoreData


extension PetCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetCategory> {
        return NSFetchRequest<PetCategory>(entityName: "PetCategory")
    }

    @NSManaged public var categoryName: String?
    @NSManaged public var image: Data?
    @NSManaged public var pet: NSSet?

}

// MARK: Generated accessors for pet
extension PetCategory {

    @objc(addPetObject:)
    @NSManaged public func addToPet(_ value: Pet)

    @objc(removePetObject:)
    @NSManaged public func removeFromPet(_ value: Pet)

    @objc(addPet:)
    @NSManaged public func addToPet(_ values: NSSet)

    @objc(removePet:)
    @NSManaged public func removeFromPet(_ values: NSSet)

}

extension PetCategory : Identifiable {

}
