//
//  CustomImage.swift
//  Final
//
//  Created by Mariami on 7/17/21.
//

import UIKit

class CustomImage: UIImageView {

    
    required public init?(coder aDecoder: NSCoder) {
        
        
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 3
        
        
    }

}
