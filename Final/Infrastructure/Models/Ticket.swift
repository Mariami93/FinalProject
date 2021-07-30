//
//  Ticket.swift
//  Final
//
//  Created by Mariami on 7/24/21.
//

import Foundation

struct Ticket: Codable {
    var seat: [Seat]
    var price: Int
    var rowCount: Int
    var seatCount: Int 
}

