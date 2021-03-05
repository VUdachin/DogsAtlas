//
//  Network Manager.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 06.10.2020.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidData
    case decodingError
    case serverError
    case invalidRequest
}

protocol NetworkWorkingLogic {
    func sendRequest<T: Decodable>(of type: T.Type, from url: URL, params: [String: String], completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkWorker: NetworkWorkingLogic {
    
    // swiftlint:disable type_name
    typealias result<T> = (Result<T, Error>) -> Void
    // swiftlint:enable type_name
    
    // MARK: - NetworkWorkingLogic
    func sendRequest<T: Decodable>(of type: T.Type, from url: URL, params: [String: String], completion: @escaping result<T>) {

        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(DataError.invalidRequest))
            return
        }

            urlComponents.queryItems = params.map {
              URLQueryItem(name: $0.key, value: $0.value)
        }

        guard let requestURL = urlComponents.url else {
            completion(.failure(DataError.invalidRequest))
            return
        }

        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }

            guard let response = response as? HTTPURLResponse else {
                completion(.failure(DataError.invalidRequest))
                return
            }

        // MARK: - Decoding data
            if 200 ... 299 ~= response.statusCode {
                if let data = data {
                    do {
                        let decodedData: T = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(DataError.decodingError))
                    }
                } else {
                    completion(.failure(DataError.invalidData))
                }
            } else {
                completion(.failure(DataError.serverError))
            }
        }.resume()
    }
}
