//
//  TicketCell.swift
//  Final
//
//  Created by Mariami on 7/27/21.
//

import UIKit

class TicketCell: UITableViewCell {

    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var seatLabel: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 10
        cellView.layer.shadowOpacity = 0.5
        cellView.layer.shadowRadius = 10
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.masksToBounds = false
        cellView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with item: BoughtTicket){
        movieLabel.text = "ფილმი: " + item.movieTitle
        timeLabel.text = "საათი: " + item.date
        var seatsString = ""
        for seat in item.seats {
            seatsString = seatsString + "რიგი: " + (seat.row + 1).description + " ადგილი: " + seat.seatNumber.description + " "
        }
        self.seatLabel.text = seatsString
        
    }
}
