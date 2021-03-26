//
//  SendMailController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 23/03/2021.
//

import UIKit

class SendMailController : UIViewController {
    
    let topView = UIView()
    let bottomView = UIView()
    
    private let backButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        return button
    }()
    
    private let titleLabel = CostumLabel(title:"Mail został \nwysłany!", size: 48, color: .black, line: 2)
    private let secondLabel = CostumLabel(title: "Nie dostałes maila? \nWyslij ponownie.", size: 24, color: .black, line: 2)
    private let avatarImage = CostumImageView(imageName: "smileAvatar")
    private let sendMailButton = CostumButton(title: "Wyślij ponownie", color: .orangeGradient(), textColor: .white, enable: true, type: .system)
    
    private let backToMenuButton : UIButton = {
        let button = UIButton()
        button.setTitle("powrót do menu >", for: .normal)
        button.setTitleColor(.primaryOrange(), for: .normal)
        button.titleLabel?.font = UIFont(name: "Sen-ExtraBold", size: 16)
        button.addTarget(self, action: #selector(handleBackToMenuButton), for: .touchUpInside)
        return button
    }()
    
    //    MARK: -  VieDidLoad
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //    MARK: - SetupView
    
    func configureUI() {
        view.backgroundColor = .white
        setupConstraints()
    }
    
    //    MARK: - Action
    
    @objc func handleBackButton() {
        print("DEBUG: - handle Back Button")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleBackToMenuButton() {
        print("DEBUG: - handle Menu Button")
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //    MARK: - SetupConstraints
    
    func setupConstraints() {
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30).isActive = true
        
        topView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 16).isActive = true
        
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 42).isActive = true
        
        topView.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
        secondLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 42).isActive = true
        
        view.addSubview(avatarImage)
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatarImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        
        bottomView.addSubview(sendMailButton)
        sendMailButton.translatesAutoresizingMaskIntoConstraints = false
        sendMailButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        sendMailButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        sendMailButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor,constant: 42).isActive = true
        sendMailButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -42).isActive = true
        
        bottomView.addSubview(backToMenuButton)
        backToMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backToMenuButton.topAnchor.constraint(equalTo: sendMailButton.bottomAnchor, constant: 5).isActive = true
        backToMenuButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
    }
}
