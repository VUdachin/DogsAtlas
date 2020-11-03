//
//  PetAdding1stInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import Foundation

protocol PetAdding1stBusinessLogic {

}

protocol PetAdding1stDataStore {

}

final class PetAdding1stInteractor: PetAdding1stBusinessLogic, PetAdding1stDataStore {

    // MARK: - Public Properties

    var presenter: PetAdding1stPresentationLogic?
    lazy var worker: PetAdding1stWorkingLogic = PetAdding1stWorker()

    // MARK: - Private Properties

    // MARK: - Business Logic

}
