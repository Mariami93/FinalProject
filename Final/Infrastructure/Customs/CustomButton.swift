//
//  CustomButton.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import UIKit

class CustomButton: LocalizedButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        
        let color = UIColor(named: "border")
        
        let txtColor = UIColor(named: "textColor")
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 3
        self.layer.borderWidth = 1.5
        self.setTitleColor(txtColor, for: .normal)
        self.layer.borderColor = color?.cgColor
        
    }
}



