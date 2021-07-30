//
//  UITableViewCell+Extension.swift
//  TeamWork
//
//  Created by user200328 on 7/5/21.
//

import UIKit

extension UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
