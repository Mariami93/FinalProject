//
//  MovieDetailsViewController.swift
//  Final
//
//  Created by Mariami on 7/18/21.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: BaseViewController{

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var posterImage: CustomImage!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var movie : Movie?
    
    @IBOutlet weak var tableView: UITableView!
     var dataSource: MovieDetailsDataSource!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configireTableView()
        self.navigationController?.navigationBar.isHidden = false
        dataSource = MovieDetailsDataSource(with: tableView, movie: movie!, segmentedControl: segmentedControl)
        dataSource.navigationVC = self.navigationController
        dataSource.coordinator = coordinator

//        self.navigationController?.isNavigationBarHidden = true
        
        let movieURL = URL(string: movie?.moviePoster ?? "")
        coverImage.kf.setImage(with: movieURL)
       
        let posterURL = URL(string: movie?.movieImage ?? "")
        posterImage.kf.setImage(with: posterURL)
        titleLabel.text = movie?.movieTitle

    }
    

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()

    }
    
    private func configireTableView() {
        tableView.separatorStyle = .none
        tableView.registerNib(class: DateCell.self)
        tableView.registerNib(class: CinemaCell.self)
        tableView.registerNib(class: DetailsCell.self)

    }
    @IBAction func playYoutube(_ sender: Any) {
        
        let youtubeId = "SxTYjptEzZs"
        var youtubeUrl = NSURL(string:"youtube://\(youtubeId)")!
        if UIApplication.shared.canOpenURL(youtubeUrl as URL){
            UIApplication.shared.openURL(youtubeUrl as URL)
        } else{
                youtubeUrl = NSURL(string:"https://www.youtube.com/watch?v=\(youtubeId)")!
            UIApplication.shared.openURL(youtubeUrl as URL)
        }
    }
    

    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            dataSource = MovieDetailsDataSource(with: tableView, movie: movie!, segmentedControl: segmentedControl)
            dataSource.navigationVC = self.navigationController
            dataSource.coordinator = coordinator
            tableView.reloadData()
            
            break
        case 1:
            
            dataSource =  MovieDetailsDataSource(with: tableView, movie: movie!, segmentedControl: segmentedControl)
            tableView.reloadData()
            break
        default:
            break
        }
    }
    
    @IBAction func backToMovies(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
