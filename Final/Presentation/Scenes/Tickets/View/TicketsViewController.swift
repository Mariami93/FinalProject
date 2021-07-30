//
//  TicketsViewController.swift
//  Final
//
//  Created by Mariami on 7/25/21.
//

import UIKit
import Firebase

class TicketsViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var boughtTickets = [BoughtTicket]()
    var dataSource : TicketDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "მთავარი".localized, style: .plain, target: self, action: #selector(goToMain))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "selectedBorder")
        self.tableView.registerNib(class: TicketCell.self)
        if let userId = Auth.auth().currentUser?.uid {
            let decoded  = UserDefaults.standard.data(forKey: userId)
            var boughtTickets = NSKeyedUnarchiver.unarchiveObject(with: decoded ?? Data()) as? [BoughtTicket] ?? []
            dataSource = TicketDataSource(with: tableView, boughtTickets: boughtTickets)
            titleLabel.text = (Auth.auth().currentUser?.displayName)! + ", თქვენი ბილეთები"
            
        }
        else  {titleLabel.text = "ბილეთების სანახავად გაიარეთ ავტორიზაცია"
        }
        
    }
    
    @objc func goToMain() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
