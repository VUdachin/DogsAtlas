//
//  Pet+CoreDataProperties.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 05.11.2020.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var age: Int64
    @NSManaged public var breed: String?
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var weight: Double
    @NSManaged public var apointments: NSSet?
    @NSManaged public var category: PetCategory?

}

// MARK: Generated accessors for apointments
extension Pet {

    @objc(addApointmentsObject:)
    @NSManaged public func addToApointments(_ value: Apointments)

    @objc(removeApointmentsObject:)
    @NSManaged public func removeFromApointments(_ value: Apointments)

    @objc(addApointments:)
    @NSManaged public func addToApointments(_ values: NSSet)

    @objc(removeApointments:)
    @NSManaged public func removeFromApointments(_ values: NSSet)

}

extension Pet : Identifiable {

}
