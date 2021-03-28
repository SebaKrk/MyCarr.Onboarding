//
//  MainViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 25/03/2021.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //    MARK: - Action
    
    @objc func handleMenuToggle() {
        print("DEBUG: Slide Menu")
    }
    @objc func handleLoguOut() {
        print("DEBUG: Logout")
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
//    MARK: - SetupView
    
    func setupView() {
        
        view.backgroundColor = .white
        UITabBar.appearance().tintColor = .primaryOrange()
        
        viewControllers = [
            createNavController(for: HomeViewController(), image: UIImage(named: "home")!),
            createNavController(for: CalendarViewController(), image: UIImage(named: "calendar")!),
            createNavController(for: NotificationsViewController(),image: UIImage(named: "bell")!),
            createNavController(for: ChatViewController(), image: UIImage(named: "chat")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        rootViewController.navigationController?.navigationBar.barTintColor = .white
        
        rootViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "hamburger").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
        
        rootViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(handleLoguOut))
        rootViewController.navigationItem.rightBarButtonItem?.tintColor = .gray
        
        return navController
    }
}
