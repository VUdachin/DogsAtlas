//
//  Apointments+CoreDataProperties.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 15.11.2020.
//
//

import Foundation
import CoreData


extension Apointments {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Apointments> {
        return NSFetchRequest<Apointments>(entityName: "Apointments")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var forPet: Pet?

}

extension Apointments : Identifiable {

}
