//
//  MovieViewModel.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import UIKit

protocol MovieViewModelProtocol: AnyObject {
    func fetchMovies(completion: @escaping((Result<[Movie], Error>) -> Void))


    init(with movieManager: MovieManagerProtocol)
}

final class MovieViewModel: MovieViewModelProtocol {

    private var movieManager: MovieManagerProtocol!
    
    
    init(with movieManager: MovieManagerProtocol){
        self.movieManager = movieManager

    }
    
    func fetchMovies(completion: @escaping((Result<[Movie], Error>) -> Void)) {
        movieManager.fetchMovies(completion: completion)
    }
    

}
