//
//  SeatCell.swift
//  Final
//
//  Created by Mariami on 7/25/21.
//

import UIKit

class SeatCell: UICollectionViewCell {

    @IBOutlet weak var seatLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        self.seatLabel.layer.borderWidth = 1
        self.seatLabel.layer.borderColor = UIColor(named: "selectedBorder")?.cgColor
        
        
    }

    func configure(with seat: Seat){
   
            seatLabel.text = String(seat.seatNumber)
        
    }
}
