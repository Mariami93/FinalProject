//
//  DetailsCell.swift
//  Final
//
//  Created by Mariami on 7/21/21.
//

import UIKit

class DetailsCell: UITableViewCell {

    @IBOutlet weak var actorView: UIView!
    @IBOutlet weak var directorView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        actorView.layer.cornerRadius = 10
        actorView.layer.shadowOpacity = 0.5
        actorView.layer.shadowRadius = 10
        actorView.layer.shadowColor = UIColor.black.cgColor
        actorView.layer.masksToBounds = false
        actorView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
        
        directorView.layer.cornerRadius = 10
        directorView.layer.shadowOpacity = 0.5
        directorView.layer.shadowRadius = 10
        directorView.layer.shadowColor = UIColor.black.cgColor
        directorView.layer.masksToBounds = false
        directorView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
        
        descriptionView.layer.cornerRadius = 10
        descriptionView.layer.shadowOpacity = 0.5
        descriptionView.layer.shadowRadius = 10
        descriptionView.layer.shadowColor = UIColor.black.cgColor
        descriptionView.layer.masksToBounds = false
        descriptionView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: Movie){
        actorLabel.text = item.actors
        directorLabel.text = item.director
        descriptionLabel.text = item.description
    }
    
}
