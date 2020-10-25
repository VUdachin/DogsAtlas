//
//  BreedInfoWorker.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 09.10.2020.
//

import Foundation

protocol BreedInfoWorkingLogic {
    func fetchBreedImage(imageId: Int, completion: @escaping (BreedImage) -> Void)
}

final class BreedInfoWorker: BreedInfoWorkingLogic {
    
  // MARK: - Private Properties
    private let networkWorker = NetworkWorker()
    private let breadImageURL = URL(string: "https://api.thedogapi.com/images/search")
    
  // MARK: - Working Logic
    
    func fetchBreedImage(imageId: Int, completion: @escaping (BreedImage) -> Void) {
        guard let breadImageURL = breadImageURL else {
            return
        }
        
        let params = ["api_key": "5b7ed827-db19-45ec-9263-b8f10db8d868", "breed_id": "\(imageId)"]
    
        networkWorker.sendRequest(of: BreedImage.self, from: breadImageURL, params: params) { (result) in
            switch result {
            case .failure(let error):
            if error is DataError {
                print(error)
            } else {
                print(error.localizedDescription)
            }
            
            case .success(let result):
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
    }
    
}
