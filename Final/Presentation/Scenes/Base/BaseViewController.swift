//
//  BaseViewController.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import UIKit

class BaseViewController: UIViewController, Storyboarded, CoordinatorDelegate {
    
    var coordinator: CoordinatorProtocol?
    @IBOutlet var sideMenuBtn: UIBarButtonItem!

    var isChoosedDark: Bool = false
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenuBtn?.target = revealViewController()
        sideMenuBtn?.action = #selector(revealViewController()?.revealSideMenu)

        if #available(iOS 13.0, *) {
            if UserDefaults.standard.bool(forKey: "mySwitch") {
                overrideUserInterfaceStyle = .dark
                mySwitch?.setOn(true, animated: true)
            } else {
                overrideUserInterfaceStyle = .light
                mySwitch?.setOn(false, animated: true)

            }
        } else {
        }

    }
    
    @IBAction func chooseTheme(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.set(true, forKey: "mySwitch")
            if #available(iOS 13.0, *) {

                overrideUserInterfaceStyle = .dark
                }
        } else {
            if #available(iOS 13.0, *) {

                overrideUserInterfaceStyle = .light
                }
            UserDefaults.standard.set(false, forKey: "mySwitch")

            
        }
    }
    
}
