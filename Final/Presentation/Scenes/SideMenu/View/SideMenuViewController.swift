//
//  SideMenuViewController.swift
//  Final
//
//  Created by Mariami on 7/21/21.
//

import UIKit
import Firebase

protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuViewController: BaseViewController {
    
    var delegate: SideMenuViewControllerDelegate?
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var sideMenuTableView: UITableView!
    
    var defaultHighlightedCell: Int = 0
    
    var menu: [SideMenu] = [
        SideMenu(icon: UIImage(named: "film_menu"), title: "movies".localized),
        SideMenu(icon: UIImage(named: "ticket_menu"), title: "tickets".localized),
        SideMenu(icon: UIImage(named: "account_menu"), title: "account".localized),
        SideMenu(icon: UIImage(named: "settings_menu"), title: "settings".localized)
    ]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadMenu), name: NSNotification.Name(rawValue: "reloadMenu"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "reloadMenu"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser != nil {
            menu.append(SideMenu(icon: UIImage(named: "signOut_menu"), title: "signOut".localized))

        }
        self.sideMenuTableView.delegate = self
        self.sideMenuTableView.dataSource = self
        self.sideMenuTableView.layer.backgroundColor = UIColor(named: "selectedBorder")?.cgColor
        self.sideMenuTableView.separatorStyle = .none
        self.sideMenuTableView.backgroundColor = UIColor(named: "buttonBG2")
        
        DispatchQueue.main.async {
            let  defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
            
        }
        

        self.sideMenuTableView.registerNib(class: SideMenuCell.self)
        self.sideMenuTableView.reloadData()
    }
    
    @objc func reloadMenu(){
        if Auth.auth().currentUser != nil   {
            if !menu.contains(where: { $0.title == "signOut".localized }) {
                self.delegate?.selectedCell(0)
                menu.append(SideMenu(icon: UIImage(named: "signOut_menu"), title: "signOut".localized))
            }
        } else {
            menu.removeAll(where: { $0.title == "signOut".localized })
        }
        self.sideMenuTableView.reloadData()
    }
}

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(class: SideMenuCell.self, for: indexPath)
        
        cell.iconImageView.image = self.menu[indexPath.row].icon
        cell.titleLabel.text = self.menu[indexPath.row].title?.localized
        
        // Highlighted color
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor =  .lightGray
        cell.selectedBackgroundView = myCustomSelectionColorView
        
//        if Auth.auth().currentUser == nil {
//            if indexPath.row == 4 {
//            cell.isHidden = true
//               }
//        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.delegate?.selectedCell(indexPath.row)
    }
}




