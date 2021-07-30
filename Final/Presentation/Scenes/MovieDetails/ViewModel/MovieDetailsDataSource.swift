//
//  MovieDetailsDataSource.swift
//  Final
//
//  Created by Mariami on 7/18/21.
//

import UIKit

class MovieDetailsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView!
    private var segmentedControl: UISegmentedControl!
    var navigationVC: UINavigationController?
    var coordinator: CoordinatorProtocol?
    
    var movie = Movie(moviePoster: "", movieImage: "", movieTitle: "", actors: "", director: "", description: "", movieGenre: [], movieDate: [], cinema: [], youtubeId: "")
    
    init(with tableView: UITableView, movie: Movie, segmentedControl: UISegmentedControl) {
        
        super.init()
        self.tableView = tableView
        self.segmentedControl = segmentedControl
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.movie = movie
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        
        switch(segmentedControl.selectedSegmentIndex)
        {
        case 0:
            returnValue = movie.cinema.count + 1
            break
        case 1:
            returnValue = 1
            break
        default:
            break
            
        }
        
        return returnValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch(segmentedControl.selectedSegmentIndex) {
        case 0:
            if indexPath.row == 0 {
                let cell = tableView.deque(class: DateCell.self, for: indexPath)
                cell.movie = movie
                return cell
            } else {
                let cell = tableView.deque(class: CinemaCell.self, for: indexPath)
                cell.fill(cinema: movie.cinema[indexPath.row - 1], delegate: self)
                return cell
            }
        case 1:
            let cell = tableView.deque(class: DetailsCell.self, for: indexPath)
            cell.configure(with: movie)
            return cell
        default:
            break
            
        }
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch(segmentedControl.selectedSegmentIndex) {
        case 0:
            if indexPath.row == 0 {
                return 140
            }
            else {
                return 200
            }
        case 1:
            return 300
        default:
            break
        }
        return 0
        
    }
    
}

extension MovieDetailsDataSource: CinemaCellDelegate {
    func didPressed(on cinema: Cinema, time: Time) {
        BuyTicketViewController.cinema = cinema
        BuyTicketViewController.movie = movie
        BuyTicketViewController.time = time
        coordinator?.proccedToBuyTicket()
        
    }
    
    func goToAutorization() {
        coordinator?.proccedToAutorization()
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ავტორიზაციის გავლა".localized, style: .default, handler: { (UIAlertAction) in
            
            self.goToAutorization()
        }))
        alert.addAction(UIAlertAction(title: "გათიშვა".localized, style: .cancel, handler: nil))

        self.navigationVC?.present(alert, animated: true, completion: nil)
    }
}

