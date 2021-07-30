//
//  RegistrationViewController.swift
//  Final
//
//  Created by Mariami on 7/21/21.
//

import UIKit
import FirebaseAuth
import Firebase

class RegistrationViewController: BaseViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var privateNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var registrationBtn: UIButton!
    private var gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRegistrationButton()
        // Do any additional setup after loading the view.
        setUpElements()
        Utilities.replaceTextWithLocalizedTextInSubviewsForView(self.view)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = registrationBtn.layer.bounds
    }
    func setUpElements() {
        
        // Hide the error label
        
        // Style the elements
        Utilities.styleTextField(nameField)
        Utilities.styleTextField(lastNameField)
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(privateNumberField)
        Utilities.styleTextField(passwordField)
        Utilities.styleTextField(confirmPasswordField)
    }
    private func configureRegistrationButton(){
        
        gradientLayer.colors = [
            UIColor(named: "buttonBG")!.cgColor,
            UIColor(named: "buttonBG2")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 15
        
        registrationBtn.layer.addSublayer(gradientLayer)
    }
    
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            privateNumberField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmPasswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            showAlert(message: "გთხოვთ, შეავსოთ ყველა ველი")
            return "გთხოვთ, შეავსოთ ყველა ველი"
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            showAlert(message: "დარწმნუნდით რომ პაროლი შეიცავს მინუმუმ 8 ასოს, ერთ სიმბოლოს და ციფრს")
            return "დარწმნუნდით რომ პაროლი შეიცავს მინუმუმ 8 ასოს, ერთ სიმბოლოს და ციფრს"
        }
        
        return nil
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            
        }
        else {
            
            // Create cleaned versions of the data
            let firstName = nameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let privateNumber = privateNumberField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                }
                else {
                    
                    let user = Auth.auth().currentUser
                    if let user = user {
                        let changeRequest = user.createProfileChangeRequest()
                        
                        changeRequest.displayName = firstName + " " + lastName
                        changeRequest.commitChanges { error in
                            if let error = error {
                                // An error happened.
                            } else {
                               
                            }
                        }
                    }
                    self.showAlert(message: "თქვენ წარმატებით გაიარეთ რეგისტრაცია")
                    
                    // Transition to the home screen

                }
                
            }
            
        }
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    
    
    
}
