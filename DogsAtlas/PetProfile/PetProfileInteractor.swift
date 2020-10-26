//
//  PetProfileInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 26.10.2020.
//

import Foundation

protocol PetProfileBusinessLogic {

}

protocol PetProfileDataStore {

}

final class PetProfileInteractor: PetProfileBusinessLogic, PetProfileDataStore {

  // MARK: - Public Properties

    var presenter: PetProfilePresentationLogic?
    lazy var worker: PetProfileWorkingLogic = PetProfileWorker()

  // MARK: - Private Properties
  
  //

  // MARK: - Business Logic
  
  //
}
