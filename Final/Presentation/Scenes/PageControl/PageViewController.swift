//
//  PageViewController.swift
//  Final
//
//  Created by Mariami on 7/21/21.
//

import UIKit

class PageViewController: UIPageViewController, Storyboarded, CoordinatorDelegate {
   
    var coordinator: CoordinatorProtocol?
    @IBOutlet var sideMenuBtn: UIBarButtonItem!

        lazy var vcList: [UIViewController] = {
            
            let authorizationSB = UIStoryboard(name: "SignInViewController", bundle: nil)
            let authorizationVC = authorizationSB.instantiateViewController(withIdentifier: "SignInViewController")
            
            let registrationSB = UIStoryboard(name: "RegistrationViewController", bundle: nil)
            let registrationVC = registrationSB.instantiateViewController(withIdentifier: "RegistrationViewController")
            
            
            return [authorizationVC, registrationVC]
        }()
        
        private var stackViewButtons: UIStackView = {
           let sv = UIStackView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.distribution = .fillEqually
            sv.spacing = 0
            return sv
        }()
        
        private var btnLeft: UIButton = {
            let b = UIButton()
            b.setTitle("logIn".localized, for: .normal)
            b.backgroundColor = UIColor(named: "buttonBG")
            b.layer.cornerRadius = 4

            b.setTitleColor(.white, for: .normal)
            b.addTarget(self, action: #selector(onLeft), for: .touchUpInside)
            return b
        }()
        
        private var btnRight: UIButton = {
            let b = UIButton()
            b.setTitle("registration".localized, for: .normal)
            b.setTitleColor(UIColor(named: "selectedBorder"), for: .normal)
            b.backgroundColor = .white
            b.layer.cornerRadius = 4
            b.addTarget(self, action: #selector(onRight), for: .touchUpInside)
            return b
        }()
        
        var currentIndex = 0
        var nextIndex = 0
        
        override func loadView() {
            super.loadView()
            
            view.addSubview(stackViewButtons)
            stackViewButtons.addArrangedSubview(btnLeft)
            stackViewButtons.addArrangedSubview(btnRight)
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            sideMenuBtn.target = revealViewController()
            sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)

            self.dataSource = self
            self.delegate = self
            self.isPagingEnabled = false

            if let first = vcList.first {
                setViewControllers([first], direction: .forward, animated: false, completion: nil)
            }
            
            NSLayoutConstraint.activate([
                stackViewButtons.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
                stackViewButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackViewButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                stackViewButtons.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        @objc func onLeft() {
            btnLeft.layer.backgroundColor = UIColor(named: "buttonBG")?.cgColor
            btnLeft.setTitleColor(.white, for: .normal)
            btnRight.layer.backgroundColor = UIColor.white.cgColor
            btnRight.setTitleColor(UIColor(named: "selectedBorder"), for: .normal)
            goToPreviousPage()
        }
        
        @objc func onRight() {
            btnRight.layer.backgroundColor = UIColor(named: "buttonBG")?.cgColor
            btnRight.setTitleColor(.white, for: .normal)
            btnLeft.layer.backgroundColor = UIColor.white.cgColor
            btnLeft.setTitleColor(UIColor(named: "selectedBorder"), for: .normal)

            goToNextPage()
        }

    }

    // MARK: - UIPageViewControllerDataSource

    extension PageViewController: UIPageViewControllerDataSource {
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = vcList.firstIndex(of: viewController) else {return nil}
            let previousIndex = index - 1
            guard previousIndex >= 0 else {return nil}
            guard vcList.count > previousIndex else {return nil}
            return vcList[previousIndex]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = vcList.firstIndex(of: viewController) else { return nil }
            let nextIndex = index + 1
            guard vcList.count != nextIndex else { return nil }
            guard vcList.count > nextIndex else {return nil}
            return vcList[nextIndex]
        }
    }

    // MARK: UIPageViewControllerDelegate
    extension PageViewController: UIPageViewControllerDelegate {
        func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
            guard
                let currentVisibleViewController = pageViewController.viewControllers?.first,
                let nextIndex = vcList.firstIndex(of: currentVisibleViewController)
                else {
                    return
            }
            
            self.nextIndex = nextIndex
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed, let currentVisibleViewController = pageViewController.viewControllers?.first, let newIndex = vcList.firstIndex(of: currentVisibleViewController) {
                self.currentIndex = newIndex
            }
            
            self.nextIndex = self.currentIndex
        }
    }
