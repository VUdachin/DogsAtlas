//
//  BreedInfoInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 09.10.2020.
//

import Foundation

protocol BreedInfoBusinessLogic {

}

protocol BreedInfoDataStore {
    var breed: Breed? { get set }
}

final class BreedInfoInteractor: BreedInfoBusinessLogic, BreedInfoDataStore {

  // MARK: - Public Properties

    var presenter: BreedInfoPresentationLogic?
    lazy var worker: BreedInfoWorkingLogic = BreedInfoWorker()

    var breed: Breed?
  // MARK: - Private Properties
  
  //

  // MARK: - Business Logic
  
  //
}
