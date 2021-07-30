//
//  InfoCell.swift
//  TeamWork
//
//  Created by Mariami on 7/5/21.
//

import UIKit
import Kingfisher

class OnBoardingCell: UICollectionViewCell {
    
    @IBOutlet weak var welcomeTitleLabel: UILabel!
    @IBOutlet weak var welcomeImage: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with item: OnBoardingViewModel) {
        
        welcomeImage.kf.setImage(with: item.imageUrl)
        welcomeLabel.text = item.text
        welcomeTitleLabel.text = item.title
    }
}
