//
//  LoginViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 20/03/2021.
//

import UIKit

class LoginViewController : UIViewController {
    
    let gradientLayer = CAGradientLayer()
    
    

    override func viewWillLayoutSubviews() {
        configureGradientBackgraound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
//    MARK: - SetupView
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
//    MARK: - Action
    
    
    
//    MARK: - SetupConstraints
    
    
 
}
