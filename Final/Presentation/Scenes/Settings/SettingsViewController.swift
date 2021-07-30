//
//  SettingsViewController.swift
//  Final
//
//  Created by Mariami on 7/23/21.
//

import UIKit
import Firebase
class SettingsViewController: BaseViewController {

    @IBOutlet weak var changeLaguageView: UIView!
    @IBOutlet weak var changeThemeView: UIView!
    @IBOutlet weak var changePasswordView: UIView!
    @IBOutlet weak var selectedLanguageLabel: LocalizedLabeL!
    @IBOutlet weak var georgianBtn: UIButton!
    @IBOutlet weak var englishBtn: UIButton!
    
    
    @IBOutlet weak var selectLanguageView: UIView!
    @IBOutlet weak var selectLnaguageTopConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var changePasswordFullView: UIView!
    @IBOutlet weak var changePasswordTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var currentPasswordField: UITextField!
    @IBOutlet weak var newPassworField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var savePasswordBtn: UIButton!
   
    private var geoGradientLayer = CAGradientLayer()
    private var engGradientLayer = CAGradientLayer()
    private var saveGradientLayer = CAGradientLayer()
    @IBOutlet weak var languageViewBottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupShadowView()
        createTapgesture()
        configureButtons()
        setUpElements()

        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)

        if Auth.auth().currentUser == nil{
            changePasswordView.isHidden = true
        } else if Auth.auth().currentUser != nil {
            changePasswordView.isHidden = false
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        geoGradientLayer.frame = georgianBtn.layer.bounds
        engGradientLayer.frame = englishBtn.layer.bounds
        saveGradientLayer.frame = savePasswordBtn.layer.bounds

    }
    
    private func setupShadowView() {
        changeLaguageView.layer.cornerRadius = 16
        changeLaguageView.layer.shadowOpacity = 0.5
        changeLaguageView.layer.shadowRadius = 16
        changeLaguageView.layer.shadowColor = UIColor.black.cgColor
        changeLaguageView.layer.masksToBounds = false
        changeLaguageView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
        
        changeThemeView.layer.cornerRadius = 16
        changeThemeView.layer.shadowOpacity = 0.5
        changeThemeView.layer.shadowRadius = 16
        changeThemeView.layer.shadowColor = UIColor.black.cgColor
        changeThemeView.layer.masksToBounds = false
        changeThemeView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
        
        changePasswordView.layer.cornerRadius = 16
        changePasswordView.layer.shadowOpacity = 0.5
        changePasswordView.layer.shadowRadius = 16
        changePasswordView.layer.shadowColor = UIColor.black.cgColor
        changePasswordView.layer.masksToBounds = false
        changePasswordView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
        
        
        selectLanguageView.layer.cornerRadius = 10
        selectLanguageView.layer.shadowOpacity = 0.5
        selectLanguageView.layer.shadowRadius = 10
        selectLanguageView.layer.shadowColor = UIColor.black.cgColor
        selectLanguageView.layer.masksToBounds = false
        selectLanguageView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
    }
    
    func setUpElements() {
        Utilities.styleTextField(currentPasswordField)
        Utilities.styleTextField(newPassworField)
        Utilities.styleTextField(confirmPasswordField)

    }
    
    func createTapgesture(){
    let languageTap = UITapGestureRecognizer(target: self, action: #selector(self.languageTapped(_:)))
        changeLaguageView.addGestureRecognizer(languageTap)
        changeLaguageView.isUserInteractionEnabled = true
    let passwordTap = UITapGestureRecognizer(target: self, action: #selector(self.passwordTapped(_:)))
        changePasswordView.addGestureRecognizer(passwordTap)
        changePasswordView.isUserInteractionEnabled = true
   
    }
    
    private func configureButtons() {
        
        geoGradientLayer.colors = [
            UIColor(named: "buttonBG")!.cgColor,
            UIColor(named: "buttonBG2")!.cgColor
        ]
        geoGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        geoGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        geoGradientLayer.cornerRadius = 15
        
        georgianBtn.layer.addSublayer(geoGradientLayer)
        
        
        engGradientLayer.colors = [
            UIColor(named: "buttonBG")!.cgColor,
            UIColor(named: "buttonBG2")!.cgColor
        ]
        engGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        engGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        engGradientLayer.cornerRadius = 15
        
        englishBtn.layer.addSublayer(engGradientLayer)
        
        saveGradientLayer.colors = [
            UIColor(named: "buttonBG")!.cgColor,
            UIColor(named: "buttonBG2")!.cgColor
        ]
        saveGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        saveGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        saveGradientLayer.cornerRadius = 15
        
        savePasswordBtn.layer.addSublayer(saveGradientLayer)
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    @objc func languageTapped(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.6) {
            self.languageViewBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    @objc func passwordTapped(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.6) {
            self.changePasswordTopConstraint.constant = 100
            self.view.layoutIfNeeded()
        }
      }
    
    @IBAction func cancelLanguageChange(_ sender: Any) {
        UIView.animate(withDuration: 0.6) {
            self.languageViewBottomConstraint.constant = 400
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func changeLanguageToEnglish(_ sender: Any) {
        self.selectedLanguageLabel.text = "English"
        UIView.animate(withDuration: 0.6) {
            self.languageViewBottomConstraint.constant = 400
            self.view.layoutIfNeeded()
        }
        
        UserDefaults().set("en", forKey: "language")
        Utilities.language(Language(rawValue: "en")!) // TODO refactor?
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)
    }
    
    @IBAction func changeLanguageToGeorgian(_ sender: Any) {
        self.selectedLanguageLabel.text = "ქართული"
        UIView.animate(withDuration: 0.6) {
            self.languageViewBottomConstraint.constant = 400
            self.view.layoutIfNeeded()
        }
        UserDefaults().set("ka", forKey: "language")
        Utilities.language(Language(rawValue: "ka")!) // TODO refactor?
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)

    }
    
    @IBAction func saveNewPassword(_ sender: Any) {

        if UserDefaults.standard.string(forKey: "UserPassword") == currentPasswordField.text {
        if newPassworField.text != "" && newPassworField.text == confirmPasswordField.text {
            Auth.auth().currentUser?.updatePassword(to: newPassworField.text!) { (error) in
                self.showAlert(message: "პაროლი წარმატებით შეიცვალა")            }
        } else {
            self.showAlert(message: "მონაცემები არ ემთხვევა ერთმანეთს")
        }
        } else {
            self.showAlert(message: "მიმდინარე პაროლი არასოწრია")
        }
        
        UIView.animate(withDuration: 0.6) {
            self.changePasswordTopConstraint.constant = 813
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func cancelPasswordChange(_ sender: Any) {
        UIView.animate(withDuration: 0.6) {
            self.changePasswordTopConstraint.constant = 813
            self.view.layoutIfNeeded()
        }
    }
}
