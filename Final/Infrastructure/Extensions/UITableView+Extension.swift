//
//  UITableView+Extension.swift
//  TeamWork
//
//  Created by user200328 on 7/5/21.
//

import UIKit

extension UITableView {

    func registerClass<T: UITableViewCell>(class: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func registerNib<T: UITableViewCell>(class: T.Type) {
        self.register(T.nib(), forCellReuseIdentifier: T.identifier)
    }

    func registerHeaderFooterNib<T: UIView>(class: T.Type) {
        let name = String(describing: self)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
    }

    func deque<T: UITableViewCell>(class: T.Type, for indexpath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexpath) as! T // swiftlint:disable:this force_cast
    }

}
