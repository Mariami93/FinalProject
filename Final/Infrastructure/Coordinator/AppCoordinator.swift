//
//  AppCoordinator.swift
//  TeamWork
//
//  Created by Nana Jimsheleishvili on 05.07.21.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Private properties
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    // MARK: - Init
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
    
    func start() {
//                let vc = FirstPageViewController.instantiateFromStoryboard()
//                vc.coordinator = self
//                navigationController?.navigationBar.isHidden = true
//                navigationController?.pushViewController(vc, animated: true)
        if UserDefaults.standard.bool(forKey: "finished"){
            let vc = MainViewController.instantiateFromStoryboard()
            vc.coordinator = self
            navigationController?.navigationBar.isHidden = true

            navigationController?.pushViewController(vc, animated: true)
            window?.rootViewController = navigationController
        } else {
            let vc = FirstPageViewController.instantiateFromStoryboard()
            vc.coordinator = self
            navigationController?.navigationBar.isHidden = true

            navigationController?.pushViewController(vc, animated: true)
            window?.rootViewController = navigationController
        }
        
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func proccedonBoardingVC(){
        let vc = OnBoardingViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func proccedtoMovieVC(){
        let vc = MainViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func proccedToMovieDetailsVC(with item: Movie) {
        let vc = MovieDetailsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.movie = item
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    func proccedSideMenu(){
        let vc = MovieDetailsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    func proccedToBuyTicket(){
        let vc = BuyTicketViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func moveTomoviesVC(with user: String) {
        let vc = MovieViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func moveToTicketVC(ticket: BoughtTicket){
        let vc = TicketsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.boughtTickets = [ticket]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func proccedToAutorization(){
        let vc = PageViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    
}
