//
//  MovieCell.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var moviePoster: UIImageView!

    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
       
        moviePoster.layer.cornerRadius = 15
}
    
    func configure(with item: Movie) {
        let posterURL = URL(string: item.movieImage ?? "")
        moviePoster.kf.setImage(with: posterURL)
       // self.moviePoster.image = UIImage(named: item.movieImage)
        self.titleLabel.text = item.movieTitle
        var ganreString = ""
        for ganre in item.movieGenre {
            
            ganreString = ganreString + " " + ganre.genre
            genreLabel.text = ganreString
        }
            }
}
