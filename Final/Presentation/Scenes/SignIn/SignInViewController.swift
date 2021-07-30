//
//  AuthorizationViewController.swift
//  Final
//
//  Created by Mariami on 7/21/21.
//

import UIKit
import FirebaseAuth


class SignInViewController: BaseViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    private var gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        configureSignInBtn()
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)
//        passwordField.placeholder = "password".localized

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = signInBtn.layer.bounds
    }
        
    
    private func configureSignInBtn(){
        
        gradientLayer.colors = [
            UIColor(named: "buttonBG")!.cgColor,
            UIColor(named: "buttonBG2")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 15
        
        signInBtn.layer.addSublayer(gradientLayer)
    }
   
    func setUpElements() {
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(passwordField)
        
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                
                self.showAlert(message: "გაიარეთ რეგისტრაცია")
                
            }
            else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadMenu"), object: nil)
                UserDefaults.standard.set(password, forKey: "UserPassword")
            }
        }
    }
    
}
