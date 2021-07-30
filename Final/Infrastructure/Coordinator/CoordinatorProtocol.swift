//
//  CoordinatorProtocol.swift
//  TeamWork
//
//  Created by Nana Jimsheleishvili on 05.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func proccedonBoardingVC()
    func proccedtoMovieVC()
    func proccedToMovieDetailsVC(with item: Movie)
    func showAlert(message: String)
    func moveTomoviesVC(with user: String)
    func popViewController()
    func proccedToBuyTicket()
    func moveToTicketVC(ticket: BoughtTicket)
    func proccedToAutorization()
    
    
}

