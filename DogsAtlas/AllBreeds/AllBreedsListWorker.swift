//
//  AllBreedsListWorker.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 07.10.2020.
//

import Foundation

protocol AllBreedsListWorkingLogic {
    func fetchBreeds(completion: @escaping (Breeds?) -> Void)
}

final class AllBreedsListWorker: AllBreedsListWorkingLogic {
    
    // MARK: - Private Properties
    private let networkWorker = NetworkWorker()
    private let allBreedsURL = URL(string: "https://api.TheDogAPI.com/v1/breeds")

    private let key = ["api_key": "5b7ed827-db19-45ec-9263-b8f10db8d868"]
    
    // MARK: - AllBreedsListWorkingLogic
    func fetchBreeds(completion: @escaping (Breeds?) -> Void) {
        
        guard let allBreedsURL = allBreedsURL else {
            completion(nil)
            return
        }
        
        networkWorker.sendRequest(of: Breeds.self, from: allBreedsURL, params: key) { (result) in
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
