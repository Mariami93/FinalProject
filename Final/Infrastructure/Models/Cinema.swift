//
//  Cinema.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import Foundation

struct Cinema: Codable, Equatable {
    var cinemaName: String
    var address: String
    var language: String
    var time: [Time]
    
    static func == (lhs: Cinema, rhs: Cinema) -> Bool {
        return lhs.cinemaName == rhs.cinemaName
    }


}
