//
//  MovieDate.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import Foundation

struct MovieDate: Codable, Equatable {
    var weekDay: String
    var month: String
    var day: String
    
    static func == (lhs: MovieDate, rhs: MovieDate) -> Bool {
        return lhs.month == rhs.month &&
            lhs.weekDay == rhs.weekDay &&
            lhs.day == rhs.day
    }

}
