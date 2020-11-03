//
//  PetAdding2ndInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 03.11.2020.
//

import Foundation

protocol PetAdding2ndBusinessLogic {

}

protocol PetAdding2ndDataStore {

}

final class PetAdding2ndInteractor: PetAdding2ndBusinessLogic, PetAdding2ndDataStore {

    // MARK: - Public Properties

    var presenter: PetAdding2ndPresentationLogic?
    lazy var worker: PetAdding2ndWorkingLogic = PetAdding2ndWorker()

    // MARK: - Private Properties

    // MARK: - Business Logic

}
