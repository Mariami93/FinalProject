//
//  DateCell.swift
//  Final
//
//  Created by Mariami on 7/19/21.
//

import UIKit

class DateCollectionCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellView.layer.cornerRadius = 15
        self.cellView.layer.borderWidth = 1.5
        self.cellView.layer.borderColor = UIColor(named: "border")?.cgColor
        self.cellView.backgroundColor = UIColor(named: "DateCellBG")
        
    }
    
    func configure(with day: String, month: String, date: String){
        
            weekDayLabel.text = day
            monthLabel.text = month
            dayLabel.text = date
       
        
    }
    
}
