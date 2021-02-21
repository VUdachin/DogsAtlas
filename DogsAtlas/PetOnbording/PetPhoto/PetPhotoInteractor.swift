//
//  PetPhotoInteractor.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 22.02.2021.
//

import Foundation

protocol PetPhotoBusinessLogic {

}

protocol PetPhotoDataStore {

}

final class PetPhotoInteractor: PetPhotoBusinessLogic, PetPhotoDataStore {

    // MARK: - Public Properties

    var presenter: PetPhotoPresentationLogic?
    lazy var worker: PetPhotoWorkingLogic = PetPhotoWorker()

    // MARK: - Private Properties

    // MARK: - Business Logic

}
