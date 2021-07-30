//
//  LanguageViewController.swift
//  Midterm
//
//  Created by Mariami on 6/8/21.
//

import UIKit

class FirstPageViewController: BaseViewController {
    
    @IBOutlet weak var generalLabel: UILabel!
    @IBOutlet weak var englishBtn: CustomButton!
    @IBOutlet weak var georgianBtn: CustomButton!
    @IBOutlet weak var continueBtn: LocalizedButton!
    @IBOutlet weak var themeView: UIView!
    private var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        configureContinueButton()
        themeView.isHidden = true
        continueBtn.isHidden = true
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = continueBtn.layer.bounds
    }
    
    
    
    private func configureContinueButton() {
        
        gradientLayer.colors = [
            UIColor(named: "buttonBG")!.cgColor,
            UIColor(named: "buttonBG2")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 15
        
        continueBtn.layer.addSublayer(gradientLayer)
    }
    
   
    @IBAction func georgian(_ sender: Any) {
        georgianBtn.layer.borderColor = UIColor(named: "selectedBorder")?.cgColor
        generalLabel.isHidden = true
        themeView.isHidden = false
        continueBtn.isHidden = false
        continueBtn.setTitle("continue", for: .normal)
        englishBtn.layer.borderColor = UIColor(named: "border")?.cgColor
        
        UserDefaults().set("ka", forKey: "language")
        Utilities.language(Language(rawValue: "ka")!) // TODO refactor?
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)

    }
    
    @IBAction func english(_ sender: Any) {
        georgianBtn.layer.borderColor = UIColor(named: "border")?.cgColor
        generalLabel.isHidden = true
        themeView.isHidden = false
        continueBtn.isHidden = false
        englishBtn.layer.borderColor = UIColor(named: "selectedBorder")?.cgColor
        continueBtn.setTitle("continue", for: .normal)

        UserDefaults().set("en", forKey: "language")
        Utilities.language(Language(rawValue: "en")!) // TODO refactor?
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)
    
    }
    
    @IBAction func moveNext(_ sender: Any) {
        coordinator?.proccedonBoardingVC()
    }
    
}

