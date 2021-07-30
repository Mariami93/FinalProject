//
//  InfoViewModelProtocol.swift
//  TeamWork
//
//  Created by Mariami on 7/5/21.
//

import UIKit


protocol OnBoardingViewModelProtocol: AnyObject {
    
    func fetchInfo(completion: @escaping (([OnBoardingViewModel]) -> Void))
    
    init(with apiManager: OnBoardingManagerProtocol, navigationController: UINavigationController?, pageControl: UIPageControl)
}

final class OnBoardingsViewModel: OnBoardingViewModelProtocol {
  
    private var apiManager: OnBoardingManagerProtocol
    private var navigationController: UINavigationController?
    private var pageControl : UIPageControl
    
    init(with apiManager: OnBoardingManagerProtocol, navigationController: UINavigationController?, pageControl: UIPageControl) {
        self.apiManager = apiManager
        self.navigationController = navigationController
        self.pageControl = pageControl
    }
    
    func fetchInfo(completion: @escaping (([OnBoardingViewModel]) -> Void)) {
        apiManager.fetchInfo { result in
            switch result {
            case .success(let response):
                completion(response.map { OnBoardingViewModel(infos: $0) })
                print(response)
            case .failure(let err):
                print(err)
            }

        }
    }

}
