
//
//  MovieViewController.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import UIKit
import DropDown

class MovieViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var viewModel: MovieViewModelProtocol!
    private var dataSource: MovieDataSource!
    private var movieManager: MovieManagerProtocol!
    
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var filterVIewTopConstraint: NSLayoutConstraint!
        
    @IBOutlet weak var topFilterBtn: UIButton!
    
    @IBOutlet weak var dropDownCinemaView: UIView!
    @IBOutlet weak var dropDownGenreView: UIView!
    @IBOutlet weak var dropCinemaLabel: UILabel!
    @IBOutlet weak var dropGenreLabel: UILabel!
    @IBOutlet weak var cinemaView: UIView!
    @IBOutlet weak var genreView: UIView!
    
    let dropDownCinema = DropDown()
    let dropDownGenre = DropDown()
    var filteredMovieArray = [Movie]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        setupLayout()
        configureViews()
        
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)
        
        filteredMovieArray = dataSource.movieArray
        
        dropDownCinema.anchorView = dropDownCinemaView
        
        dropDownGenre.anchorView = dropDownGenreView

        
        navigationController?.navigationBar.tintColor = .white
        
        filterView.layer.cornerRadius = 15
        filterView.clipsToBounds = true
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ფილტრი".localized, style: .plain, target: self, action: #selector(filterTapped))
        dataSource.refresh()
        
    }
    
    
    private func setupLayout() {
        collectionView.registerNib(class: MovieCell.self)
    }
    
    private func configureViewModel() {
        movieManager = MovieManager()
        viewModel = MovieViewModel(with: movieManager)
        dataSource = MovieDataSource(with: collectionView, viewModel: viewModel)
        dataSource.coordinator = coordinator
        dataSource.navigationVC = self.navigationController
    }
    
    func configureViews() {
        cinemaView.layer.cornerRadius = 16
        cinemaView.layer.shadowOpacity = 0.5
        cinemaView.layer.shadowRadius = 16
        cinemaView.layer.shadowColor = UIColor.black.cgColor
        cinemaView.layer.masksToBounds = false
        cinemaView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
        
        genreView.layer.cornerRadius = 16
        genreView.layer.shadowOpacity = 0.5
        genreView.layer.shadowRadius = 16
        genreView.layer.shadowColor = UIColor.black.cgColor
        genreView.layer.masksToBounds = false
        genreView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
    }
    
    @IBAction func filterAction(_ sender: Any) {
        self.collectionView.reloadData()
        UIView.animate(withDuration: 0.6) {
            self.filterVIewTopConstraint.constant = 0
            self.collectionView.isUserInteractionEnabled = true
            self.view.layoutIfNeeded()
        } 
    }
    
    
    @IBAction func dropCinema(_ sender: Any) {
        dropDownCinema.dataSource = dataSource.cinemaArray
        dropDownCinema.show()
        dropDownCinema.bottomOffset = CGPoint(x:0, y: -(dropDownCinema.anchorView?.plainView.bounds.height)!)
        dropDownCinema.direction = .bottom
        dropDownCinema.selectionAction = {[unowned self](index: Int, item: String) in
            
            self.dropCinemaLabel.text = dataSource.cinemaArray[index]
            self.filterCinema(cinemasrt: dataSource.cinemaArray[index])
            
        }
    }
    
    @IBAction func dropGenre(_ sender: Any) {
        dropDownGenre.dataSource = dataSource.genreArray
        dropDownGenre.show()
        dropDownGenre.bottomOffset = CGPoint(x:0, y: -(dropDownGenre.anchorView?.plainView.bounds.height)!)
        dropDownGenre.direction = .bottom
        dropDownGenre.selectionAction = {[unowned self](index: Int, item: String) in
            
            self.dropGenreLabel.text = dataSource.genreArray[index]
            self.filteredMovieArray = dataSource.movieArray
            self.filterGenre(genresrt: dataSource.genreArray[index])
        }
    }
    
    func filterGenre(genresrt: String) {
        var filteredGenre = [Movie]()
        for movie in filteredMovieArray {
            for genre in movie.movieGenre {
                if genresrt == genre.genre {
                    filteredGenre.append(movie)
                }
            }
        }
        filteredMovieArray = filteredGenre
        dataSource.filteredMovieArray = filteredMovieArray
        dataSource.reload()
    }
    
    func filterCinema(cinemasrt: String) {
        var filteredCinema = [Movie]()
        for movie in filteredMovieArray {
            for cinema in movie.cinema {
                if cinemasrt == cinema.cinemaName {
                    filteredCinema.append(movie)
                }
            }
        }
        filteredMovieArray = filteredCinema
        dataSource.filteredMovieArray = filteredMovieArray
        dataSource.reload()
    }
    
    
    @objc func filterTapped () {
        UIView.animate(withDuration: 0.6) {
            self.filterVIewTopConstraint.constant = -400
            self.collectionView.isUserInteractionEnabled = false
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func cancelFilter(_ sender: Any) {
        UIView.animate(withDuration: 0.6) {
            self.filterVIewTopConstraint.constant = 0
            self.collectionView.isUserInteractionEnabled = true
            self.view.layoutIfNeeded()
        }
        dataSource.filteredMovieArray = dataSource.movieArray
        dataSource.reload()
    }

}



