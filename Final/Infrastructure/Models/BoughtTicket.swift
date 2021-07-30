//
//  BoughtTicket.swift
//  Final
//
//  Created by Mariami on 7/25/21.
//

import Foundation

class BoughtTicket: NSObject, Codable, NSSecureCoding {
    
    static var supportsSecureCoding: Bool {
        return true
    }

    var movieTitle: String
    var cinemaName: String
    var date: String
    var language: String
    var ticketPrice: Int
    var seats: [Seat]
    
    init(movieTitle: String, cinemaName: String, date: String, language: String, seats: [Seat], ticketPrice: Int) {
        self.movieTitle = movieTitle
        self.cinemaName = cinemaName
        self.date = date
        self.language = language
        self.seats = seats
        self.ticketPrice = ticketPrice
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let movieTitle = aDecoder.decodeObject(forKey: "movieTitle") as! String
        let cinemaName = aDecoder.decodeObject(forKey: "cinemaName") as! String
        let date = aDecoder.decodeObject(forKey: "date") as! String
        let language = aDecoder.decodeObject(forKey: "language") as! String
        let seats =  aDecoder.decodeObject(forKey: "seats") as! [Seat]
        let ticketPrice = aDecoder.decodeInteger(forKey: "ticketPrice")
        self.init(movieTitle: movieTitle, cinemaName: cinemaName, date: date, language: language, seats: seats, ticketPrice: ticketPrice)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(movieTitle, forKey: "movieTitle")
        aCoder.encode(cinemaName, forKey: "cinemaName")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(language, forKey: "language")
        aCoder.encode(seats, forKey: "seats")
        aCoder.encode(ticketPrice, forKey: "ticketPrice")

    }

    override func isEqual(_ object: Any?) -> Bool {
        return self.movieTitle == (object as! BoughtTicket).movieTitle &&
            self.cinemaName == (object as! BoughtTicket).cinemaName &&
            self.date == (object as! BoughtTicket).date
    }

}
