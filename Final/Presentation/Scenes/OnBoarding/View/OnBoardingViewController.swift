//
//  OnBoardingViewController.swift
//  TeamWork
//
//  Created by user200328 on 7/5/21.
//

import UIKit

class OnBoardingViewController: BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var finishBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    private var viewModel: OnBoardingViewModelProtocol!
    private var dataSource: OnBoardingDataSource!
    private var apiManager: OnBoardingManagerProtocol!
    var i: Int = 0
    var isLoading: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)

        
        collectionView.registerNib(class: OnBoardingCell.self)

        configureViewModel()
        self.navigationController?.navigationBar.isHidden = true
        
        
    }
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    private func configureViewModel() {
        apiManager = OnBoardingManager()
        viewModel = OnBoardingsViewModel(with: apiManager!, navigationController: self.navigationController, pageControl: self.pageControl)
        dataSource = OnBoardingDataSource(with: collectionView,
                                    viewModel: viewModel, pageControl: pageControl)
        
        dataSource.refresh()
    }
    

    @IBAction func finish(_ sender: Any) {
        coordinator?.proccedtoMovieVC()
        UserDefaults.standard.set(true, forKey: "finished")

    }
    
    func moveCollectionToFrame(contentOffset : CGFloat) {
        
        let frame: CGRect = CGRect(x : contentOffset ,y : self.collectionView.contentOffset.y ,width : self.collectionView.frame.width,height : self.collectionView.frame.height)
        self.collectionView.scrollRectToVisible(frame, animated: true)
    }
    
}

