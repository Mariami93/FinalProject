//
//  SideMenuCell.swift
//  Final
//
//  Created by Mariami on 7/21/21.
//

import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor = .clear
        self.iconImageView.tintColor = .white
        
        self.titleLabel.textColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
