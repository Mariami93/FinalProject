//
//  CinemaCell.swift
//  Final
//
//  Created by Mariami on 7/19/21.
//

import UIKit
import Firebase

protocol CinemaCellDelegate: class {
    func didPressed(on cinema: Cinema, time: Time)
    func showAlert(message: String)
}

class CinemaCell: UITableViewCell {
    
    @IBOutlet weak var cinemaLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: CinemaCellDelegate?
    var cinema: Cinema!
    
    var coordinator: CoordinatorProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.registerNib(class: TimeCell.self)
    }
    
  
    
    func fill(cinema: Cinema, delegate: CinemaCellDelegate) {
        self.delegate = delegate
        self.cinemaLabel.text = cinema.cinemaName
        self.addressLabel.text = cinema.address
        self.languageLabel.text = cinema.language
        self.cinema = cinema
    }
}

extension CinemaCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cinema.time.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(TimeCell.self, for: indexPath)
        cell.fill(time: cinema.time[indexPath.row].time!)
        return cell
    }
}

extension CinemaCell: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if Auth.auth().currentUser != nil {
        self.delegate?.didPressed(on: cinema,time: cinema.time[indexPath.row])
    }
        else if Auth.auth().currentUser == nil {
            self.delegate?.showAlert(message: "იმისათვის რომ იყიდოთ ბილეთი, გაიარეთ ავტორიზაცია")
        }
    }
    
}

extension CinemaCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3 , height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
