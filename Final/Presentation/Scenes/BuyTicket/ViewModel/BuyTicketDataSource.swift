//
//  BuyTicketDataSource.swift
//  Final
//
//  Created by Mariami on 7/25/21.
//

import UIKit
import Firebase

class BuyTicketDataSource: NSObject {
    
    private var collectionView: UICollectionView!
    var selectedSeats = [Seat]()
    var selectedTickets = [BoughtTicket]()
    var boughtSeats = [Seat]()
    var boughtTickets = [BoughtTicket]()
    var ticket =  Ticket(seat: [], price: 5, rowCount: 10, seatCount: 8)
    var movie: Movie?
    
    init(with collectionView: UICollectionView, ticket: Ticket, movie: Movie) {
        
        super.init()
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.ticket = ticket
        self.movie = movie
        self.getBoughtTickets()
        collectionView.reloadData()
    }
    
    func getBoughtTickets() {
        let decoded  = UserDefaults.standard.data(forKey: Auth.auth().currentUser!.uid)
        boughtTickets = NSKeyedUnarchiver.unarchiveObject(with: decoded ?? Data()) as? [BoughtTicket] ?? []
        for ticket in boughtTickets {
            if ticket.movieTitle == movie?.movieTitle {
                self.boughtSeats = ticket.seats
            }
        }
    }
    
    func isSeatBought(seat: Seat) -> Bool {
        for ticket in self.boughtTickets {
            if ticket.movieTitle == BuyTicketViewController.movie.movieTitle &&
               ticket.cinemaName == BuyTicketViewController.cinema.cinemaName &&
                ticket.date == BuyTicketViewController.time?.time &&
                ticket.seats.contains(seat) {
                return true
            }
        }
        return false
    }
}

extension BuyTicketDataSource:  UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.ticket.rowCount
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ticket.seatCount + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(SeatCell.self, for: indexPath)
        if indexPath.row == 0 {
            cell.seatLabel.text = (self.ticket.rowCount - indexPath.section).description
            cell.seatLabel.layer.backgroundColor = UIColor(named: "buttonBG2")?.cgColor
        } else {
            let seat = Seat(row: indexPath.section, seatNumber: indexPath.row)
            if isSeatBought(seat: seat) {
                cell.seatLabel.layer.backgroundColor = UIColor(named: "buttonBG")?.cgColor
                cell.isUserInteractionEnabled = false
            } else if selectedSeats.contains(seat) {
                cell.seatLabel.layer.backgroundColor = UIColor(named: "selectedSeat")?.cgColor
                cell.isUserInteractionEnabled = true
            } else {
                cell.seatLabel.layer.backgroundColor = UIColor.white.cgColor
                cell.isUserInteractionEnabled = true
            }
            cell.seatLabel.text = indexPath.row.description

        }
        return cell
    }
}

extension BuyTicketDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let seat = Seat(row: indexPath.section, seatNumber: indexPath.row)
        if selectedSeats.contains(seat) {
            if let index = selectedSeats.firstIndex(of: seat) {
                selectedSeats.remove(at: index)
            }
        } else {
            selectedSeats.append(seat)
        }
        collectionView.reloadItems(at: [indexPath])
    }
}

extension BuyTicketDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 25, height: 25)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


