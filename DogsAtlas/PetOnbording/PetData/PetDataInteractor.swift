//
//  PetDataInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 21.02.2021.
//

import Foundation

protocol PetDataBusinessLogic {

}

protocol PetDataDataStore {

}

final class PetDataInteractor: PetDataBusinessLogic, PetDataDataStore {

    // MARK: - Public Properties

    var presenter: PetDataPresentationLogic?
    lazy var worker: PetDataWorkingLogic = PetDataWorker()

    // MARK: - Private Properties

    // MARK: - Business Logic

}
