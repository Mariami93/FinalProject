//
//  TimeCell.swift
//  Final
//
//  Created by Mariami on 7/19/21.
//

import UIKit

class TimeCell: UICollectionViewCell {
   
    @IBOutlet weak var timeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fill(time: String) {
        self.timeButton.setTitle(time, for: .normal)
    }
    @IBAction func testAction(_ sender: Any) {
        
        
    }
    
}
