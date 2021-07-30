//
//  TicketDataSource.swift
//  Final
//
//  Created by Mariami on 7/27/21.
//



import UIKit

class TicketDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView!
    
    var boughtTickets = [BoughtTicket]()
    
    init(with tableView: UITableView, boughtTickets: [BoughtTicket]) {
        
        super.init()
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.boughtTickets = boughtTickets
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boughtTickets.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(class: TicketCell.self, for: indexPath)
        cell.configure(with: boughtTickets[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 250
    }
    
}
