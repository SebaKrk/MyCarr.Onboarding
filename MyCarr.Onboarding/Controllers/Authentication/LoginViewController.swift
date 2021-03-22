//
//  LoginViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 20/03/2021.
//

import UIKit

class LoginViewController : UIViewController {
    
    let gradientLayer = CAGradientLayer()
    
    let topView = UIView()
    let scrollView = UIScrollView()
    let bottomView = UIView()
    
    private let titleLabel = CostumLabel(title: "Zaloguj się", size: 48, color: .white, line: 1)
    private let emailTextField = CostumTextFields(placeHolder: "enter your email adress")
    private let passwordTextField = CostumTextFields(placeHolder: "enter your password", isSecure: true)
    
    
    
    
    private let logoImageLabel : UIImageView = {
        var imageView = UIImageView()
        imageView = UIImageView(image: #imageLiteral(resourceName: "MyCarrrLogo"))
        return imageView
    }()
    

    override func viewWillLayoutSubviews() {
        
        configureGradientBackgraound()
        setupConstraints()
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
    
    func setupConstraints() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        topView.backgroundColor = .red
        
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true;
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true;
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true;
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        scrollView.backgroundColor = .blue

        
        let stack = UIStackView(arrangedSubviews: [emailTextField,passwordTextField])
        scrollView.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 50

        stack.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 50).isActive = true
        stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -50).isActive = true
        stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        bottomView.backgroundColor = .red
        
        bottomView.addSubview(logoImageLabel)
        logoImageLabel.translatesAutoresizingMaskIntoConstraints = false
        logoImageLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        logoImageLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
    }
    
 
}
