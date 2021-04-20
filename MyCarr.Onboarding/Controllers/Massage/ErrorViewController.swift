//
//  ErrorViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 28/03/2021.
//

import UIKit

class ErrorViewController : UIViewController {
    
    let topView = UIView()
    let centerView = UIView()
    let bottomView = UIView()

    private let titleLabel = CostumLabel(title:"Caramba! \ncoś poszło \nnie tak", size: 48, color: .black, line: 3)
    
    private let avatarImage = CostumImageView(imageName: "errorAvatar")
    
    private let backToMenuButton : CostumButton = {
        let button = CostumButton(title: "Powrót do menu", color: .orangeGradient(), textColor: .white, enable: true, type: .system)
        button.addTarget(self, action: #selector(handleBackToMenuButton), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    //    MARK: - Action
    
    @objc func handleBackButton() {
        print("DEBUG: Back")
        navigationController?.popViewController(animated: true)
    }
    @objc func handleBackToMenuButton() {
        print("DEBUG: Back to menu ")
        navigationController?.popViewController(animated: true)
    }
    
 
    //    MARK: - SetupView
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
    
        view.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    //    MARK: - SetupConstraints
    
    func setupConstraints() {
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topView.topAnchor,constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 42).isActive = true
        
        centerView.addSubview(avatarImage)
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true
        avatarImage.centerXAnchor.constraint(equalTo: centerView.centerXAnchor).isActive = true
        
        bottomView.addSubview(backToMenuButton)
        backToMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backToMenuButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        backToMenuButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        backToMenuButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 46).isActive = true
        backToMenuButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -46).isActive = true

    }
}
