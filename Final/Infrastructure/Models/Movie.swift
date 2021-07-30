//
//  Movie.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import Foundation

struct Movie: Codable {
    var moviePoster: String
    var movieImage: String
    var movieTitle: String
    var actors: String
    var director: String
    var description: String
    var movieGenre: [Genre]
    var movieDate: [MovieDate]
    var cinema: [Cinema]
    var youtubeId : String
    
}


