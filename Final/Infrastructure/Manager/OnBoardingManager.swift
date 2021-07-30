//
//  WelcomeManager.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import Foundation


import Foundation

protocol OnBoardingManagerProtocol: AnyObject {
    func fetchInfo(completion: @escaping ((Result<[OnBoarding], Error>) -> Void))
}

class OnBoardingManager: OnBoardingManagerProtocol {
    func fetchInfo(completion: @escaping ((Result<[OnBoarding], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/732a26fb-a766-4160-8b51-8c80bea37d38"
        NetworkManager.shared.get(url: url) { (result: Result<[OnBoarding], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}

