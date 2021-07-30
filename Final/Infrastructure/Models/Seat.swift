//
//  Seat.swift
//  Final
//
//  Created by Mariami on 7/24/21.
//

import Foundation

class Seat: NSObject, Codable, NSSecureCoding {
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    var row: Int
    var seatNumber : Int
    
    init(row: Int, seatNumber: Int) {
        self.row = row
        self.seatNumber = seatNumber

    }

    required convenience init(coder aDecoder: NSCoder) {
        let row = aDecoder.decodeInteger(forKey: "row")
        let seatNumber = aDecoder.decodeInteger(forKey: "seatNumber")
        self.init(row: row, seatNumber: seatNumber)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(row, forKey: "row")
        aCoder.encode(seatNumber, forKey: "seatNumber")
    }

    override func isEqual(_ object: Any?) -> Bool {
        return self.row == (object as! Seat).row &&
            self.seatNumber == (object as! Seat).seatNumber
    }
}
