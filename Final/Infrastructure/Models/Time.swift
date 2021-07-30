//
//  Time.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import Foundation


struct Time: Codable {
    var time: String?
    var biletebi: [Ticket]

    enum CodingKeys: String, CodingKey {
        case time = "time"
        case biletebi = "ticket"
    }
}
