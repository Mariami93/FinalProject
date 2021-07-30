//
//  Row.swift
//  Final
//
//  Created by Mariami on 7/24/21.
//

import Foundation

struct Row: Codable {
    var rowNumber : Int
    var ticketPrice : Int
    var seat: [Seat]

}
