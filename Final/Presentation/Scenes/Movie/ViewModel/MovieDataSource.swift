//
//  MovieDataSource.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import UIKit

class MovieDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    private var collectionView: UICollectionView!
    private var viewModel: MovieViewModelProtocol!
    var movieArray = [Movie]()
    var filteredMovieArray = [Movie]()
    var cinemaArray = [String]()
    var genreArray = [String]()
    var coordinator: CoordinatorProtocol?
    var window: UIWindow?
    var navigationVC: UINavigationController?
    
    init(with collectionView: UICollectionView, viewModel: MovieViewModelProtocol) {
        super.init()
        self.collectionView = collectionView
        self.viewModel = viewModel
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
    func refresh() {
        viewModel.fetchMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movieArray = movies
                self?.filteredMovieArray = movies
                DispatchQueue.main.async {
                    
                    self?.collectionView.reloadData()
                    self?.fillFilterData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func reload() {
        self.collectionView.reloadData()
    }
    
    func fillFilterData() {
        for movie in movieArray {
            for genre in movie.movieGenre {
                if !genreArray.contains(genre.genre) {
                    genreArray.append(genre.genre)
                }
            }
            for cinema in movie.cinema {
                if !cinemaArray.contains(cinema.cinemaName) {
                    cinemaArray.append(cinema.cinemaName)
                }
            }
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMovieArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.deque(MovieCell.self, for: indexPath)
        cell.configure(with: filteredMovieArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: (width - 40) / 3, height: height / 2.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator = AppCoordinator(window, navigationController: self.navigationVC)
        coordinator?.proccedToMovieDetailsVC(with: filteredMovieArray[indexPath.row])
        
    }
    
}


