//
//  MovieManager.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import Foundation

protocol MovieManagerProtocol: AnyObject {
    func fetchMovies(completion: @escaping ((Result<[Movie], Error>) -> Void))
}

class MovieManager: MovieManagerProtocol {
    func fetchMovies(completion: @escaping ((Result<[Movie], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/e12109f0-9b8c-4812-a91e-d6864aa06292"
        NetworkManager.shared.get(url: url) { (result: Result<[Movie], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
                
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
