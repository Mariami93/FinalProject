//
//  BuyTicketViewController.swift
//  Final
//
//  Created by Mariami on 7/24/21.
//

import UIKit
import Firebase

class BuyTicketViewController: BaseViewController {

    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var cinemaLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyBtn: LocalizedButton!
    private var gradientLayer = CAGradientLayer()
    @IBOutlet weak var isSoldView: UIView!
    @IBOutlet weak var priceView: UIView!
    
    var boughtTickets = [BoughtTicket]()
    var dataSource: BuyTicketDataSource!
    static var movie = Movie(moviePoster: "", movieImage: "", movieTitle: "", actors: "", director: "", description: "", movieGenre: [], movieDate: [], cinema: [], youtubeId: "")
    static var dateIndex: Int = 0
    static var cinema = Cinema(cinemaName: "", address: "", language: "", time: [])
    static var time: Time?
    private var ticket =  Ticket(seat: [], price: 0, rowCount: 0, seatCount: 0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBuyBtn()
        configureViews()
        self.collectionView.registerNib(class: SeatCell.self)
        dataSource = BuyTicketDataSource(with: collectionView, ticket: BuyTicketViewController.time!.biletebi[0], movie: BuyTicketViewController.movie)
        self.movieLabel.text = BuyTicketViewController.movie.movieTitle
        self.cinemaLabel.text = BuyTicketViewController.cinema.cinemaName
        self.timeLabel.text = BuyTicketViewController.time?.time
        self.languageLabel.text = BuyTicketViewController.cinema.language
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)
        
    self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = buyBtn.layer.bounds
    }

    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()

    }
    private func configureBuyBtn(){
        
        gradientLayer.colors = [
            UIColor(named: "buttonBG")!.cgColor,
            UIColor(named: "buttonBG2")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 15
        
        buyBtn.layer.addSublayer(gradientLayer)
    }
    
    func configureViews(){
        priceView.layer.borderWidth = 1
        priceView.layer.borderColor = UIColor(named: "selectedBorder")?.cgColor
        priceView.layer.cornerRadius = 10
        
        isSoldView.layer.cornerRadius = 10
    }

    @IBAction func backToMoveDetails(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buyTicket(_ sender: Any) {
        let boughtTicket = BoughtTicket(movieTitle: BuyTicketViewController.movie.movieTitle,
                                        cinemaName: BuyTicketViewController.cinema.cinemaName,
                                        date: BuyTicketViewController.time?.time ?? "",
                                        language: BuyTicketViewController.cinema.language,
                                        seats: self.dataSource.selectedSeats,
                                        ticketPrice: 12)
        self.saveTicket(ticket: boughtTicket)
    }
    
    func saveTicket(ticket: BoughtTicket) {
        let decoded  = UserDefaults.standard.data(forKey: Auth.auth().currentUser!.uid)
        var boughtTickets = NSKeyedUnarchiver.unarchiveObject(with: decoded ?? Data()) as? [BoughtTicket] ?? []
        if let index = boughtTickets.firstIndex(of: ticket) {
            let seats = ticket.seats + boughtTickets[index].seats
            boughtTickets[index].seats = seats
        } else {
            boughtTickets.append(ticket)
        }
        let encodedData: Data = (try? NSKeyedArchiver.archivedData(withRootObject: boughtTickets, requiringSecureCoding: true)) ?? Data()
        UserDefaults.standard.set(encodedData, forKey: Auth.auth().currentUser!.uid)
        UserDefaults.standard.synchronize()
        coordinator?.moveToTicketVC(ticket: ticket)
        
    }
}
