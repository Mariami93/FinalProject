//
//  DateCell.swift
//  Final
//
//  Created by Mariami on 7/19/21.
//

import UIKit

class DateCell: UITableViewCell {

    private var movieManager: MovieManagerProtocol!
    private var selectedMovieDate: MovieDate?
    var movie = Movie(moviePoster: "", movieImage: "", movieTitle: "", actors: "", director: "", description: "", movieGenre: [], movieDate: [], cinema: [], youtubeId: "")
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
        
    }
    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(class: DateCollectionCell.self)
        
    }
}

extension DateCell:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.movieDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(DateCollectionCell.self, for: indexPath)
        cell.configure(with: movie.movieDate[indexPath.row].weekDay, month: movie.movieDate[indexPath.row].month, date: movie.movieDate[indexPath.row].day)
        if selectedMovieDate == movie.movieDate[indexPath.row] {
            cell.cellView.backgroundColor = .white
            cell.cellView.layer.borderColor = UIColor(named: "selectedBorder")?.cgColor
            BuyTicketViewController.dateIndex = indexPath.row
            BuyTicketViewController.movie = movie
        } else {
            cell.cellView.backgroundColor = .white
            cell.cellView.layer.borderColor = UIColor(named: "border")?.cgColor
            BuyTicketViewController.dateIndex = indexPath.row

        }
        return cell
    }
}

extension DateCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMovieDate = movie.movieDate[indexPath.row]
        collectionView.reloadData()
    }
}

extension DateCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: (width - 20) / 4, height: height - 10)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
}
