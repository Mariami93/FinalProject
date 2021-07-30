//
//  Utilities.swift
//  Final
//
//  Created by Mariami on 7/23/21.
//


import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width - 40, height: 1)
        
        bottomLine.backgroundColor = UIColor(named:"border")?.cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        let gradientLayer = CAGradientLayer()
       
        gradientLayer.frame = button.layer.bounds

        gradientLayer.colors = [
            UIColor(named: "buttonBG")!.cgColor,
            UIColor(named: "buttonBG2")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 10
        
        button.layer.addSublayer(gradientLayer)
      
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
    /// Laguages
    
    
    static func language() -> Language {
        return (UIApplication.shared.delegate as! AppDelegate).language
    }
    
    
    static func language(_ lang: Language) {
        (UIApplication.shared.delegate as! AppDelegate).language = lang
    }

    static func bundle() -> Bundle? {
        return (UIApplication.shared.delegate as! AppDelegate).bundle
    }

    
    static func getUserDefaultLanguage() -> Language {
        var language: Language?
        if let languageKey = UserDefaults.standard.string(forKey: "language"){
            language = Language(rawValue: languageKey)
        }
        
        return language ?? Language.Geo
    }
    
    static func replaceTextWithLocalizedTextInSubviewsForView(_ view: UIView) {
        for v in view.subviews {
            if (v.subviews.count > 0) {
                Utilities.replaceTextWithLocalizedTextInSubviewsForView(v )
            }
            
            if let label = v as? LocalizedLabeL {
                if let key = label.key {
                    label.text = key.localized
                } else {
                    label.text = label.text?.localized
                }
                label.sizeToFit()
            }
            
            if let button = v as? UIButton {
                var buttonText = button.titleLabel?.text ?? ""
                if let localizedButton = button as? LocalizedButton, localizedButton.key != nil {
                    buttonText = localizedButton.key!
                }
                button.setTitle(buttonText.localized, for: UIControl.State())
            }
            
            if let textField = v as? UITextField {
                textField.placeholder = textField.placeholder?.localized
            }
        }
        view.setNeedsLayout()
        view.layoutSubviews()

    }
}

enum Language : String {
    case Geo = "ka"
    case Eng = "en"
    case Rus = "ru"
    
    func locale() -> Locale {
//        let localeIdentifier = self == .Geo ? "ka_GE" : "en_US"
        return Locale(identifier: self.rawValue)
    }
}
