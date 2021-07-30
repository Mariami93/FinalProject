//
//  UIPageViewControllerExtension.swift
//  Final
//
//  Created by Mariami on 7/21/21.
//

import UIKit

extension UIPageViewController {
    var isPagingEnabled: Bool {
        get {
            var isEnabled: Bool = true
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    isEnabled = subView.isScrollEnabled
                }
            }
            return isEnabled
        }
        set {
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    subView.isScrollEnabled = newValue
                }
            }
        }
    }
    
    func nextPage(using index: Int) {
        DispatchQueue.main.async {
            // აქ მოსულ ინდექსზე უნდა მოხდეს გვერდის შეცვლა / გვერდზე გადასვლა
            // რომელსაც ეს index-შეესაბამება
        }
    }
    
    func goToNextPage() {
        DispatchQueue.main.async {
            guard let currentViewController = self.viewControllers?.first else { return }
            guard let nextViewController = self.dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
            self.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func goToPreviousPage() {
        DispatchQueue.main.async {
            guard let currentViewController = self.viewControllers?.first else { return }
            guard let previousViewController = self.dataSource?.pageViewController(self, viewControllerBefore: currentViewController) else { return }
            self.setViewControllers([previousViewController], direction: .reverse, animated: true, completion: nil)
        }
    }
}

