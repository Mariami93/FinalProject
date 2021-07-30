//
//  Genre.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import Foundation

struct  Genre: Codable, Equatable {
    var genre: String
    
    static func == (lhs: Genre, rhs: Genre) -> Bool {
        return lhs.genre == rhs.genre
    }


}
