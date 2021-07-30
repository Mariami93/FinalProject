//
//  InfoDataSource.swift
//  TeamWork
//
//  Created by Mariami on 7/5/21.
//

import UIKit

class OnBoardingDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
    private var viewModel: OnBoardingViewModelProtocol!
    private var infoViewModel = [OnBoardingViewModel]()
    private var pageControl: UIPageControl!
    static var itemsCount: Int!
    var coordinator: CoordinatorProtocol!
    var window: UIWindow?

    init(with collectionView: UICollectionView, viewModel: OnBoardingViewModelProtocol, pageControl: UIPageControl) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.viewModel = viewModel
        self.pageControl = pageControl
        

    }
    
    func refresh() {
        viewModel.fetchInfo{ viewModels in
            self.infoViewModel.append(contentsOf: viewModels)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                OnBoardingDataSource.itemsCount = self.infoViewModel.count
            }
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.deque(OnBoardingCell.self, for: indexPath)
            cell.configure(with: infoViewModel[indexPath.row])
            return cell
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if infoViewModel.count  == 0 { return 0}
        let count = infoViewModel.count 
        pageControl.numberOfPages = count
        pageControl.isHidden = !(count > 1)
        
        return count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
}

