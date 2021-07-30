//
//  StringExtension.swift
//  Final
//
//  Created by Mariami on 7/28/21.
//

import Foundation


extension String {
    
    var localized: String {
        //return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
        let bundle = Utilities.bundle() ?? Bundle.main
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
}
