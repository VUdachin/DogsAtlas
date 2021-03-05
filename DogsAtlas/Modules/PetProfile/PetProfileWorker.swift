//
//  PetProfileWorker.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 26.10.2020.
//

import Foundation
import CoreData

protocol PetProfileWorkingLogic {
    func fetchPetsFromLocalDataStore(completion: @escaping (Result<[NSManagedObject], Error>) -> Void)
}

final class PetProfileWorker: PetProfileWorkingLogic {

    // MARK: - Private Properties
    let context = CoreDataWoker.shared.context

    // MARK: - Working Logic
    func fetchPetsFromLocalDataStore(completion: @escaping (Result<[NSManagedObject], Error>) -> Void) {
        let request = NSFetchRequest<NSManagedObject>(entityName: "Pet")
        do {
            let pets = try context.fetch(request)
            completion(.success(pets))
        } catch {
            completion(.failure(error))
        }
    }

}
