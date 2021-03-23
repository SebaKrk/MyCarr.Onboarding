//
//  ResetPasswordController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 23/03/2021.
//

import UIKit

class ResetPasswordController : UIViewController {
    
    let topView = UIView()
    let centralView = UIView()
    let bottomView = UIView()
    
    private let backButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        return button
    }()
    
    private let titleLabel = CostumLabel(title: "Nie \npamietam \nhasła", size: 48, color: .black, line: 3)
    private let avatarIamge = CostumImageView(imageName: "sadAvarar")
    private let emailTextField = CostumRegistrationTF(placeHolder: "Podaj swój email")
    
    private let resetButton : CostumButton = {
        let button = CostumButton(title: "Wyslij magiczny link!", color: .orangeGradient(), textColor: .white, enable: true, type: .system)
        button.addTarget(self, action: #selector(handleResetButton), for: .touchUpInside)
        return button
    }()
    
    
    //    MARK: VieDidLoad
    
    override func viewWillLayoutSubviews() {
        setupConstraints()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //    MARK: - SetupView
    
    func configureUI() {
        view.backgroundColor = .white
    }
    
    //    MARK: - Action
    
    @objc func handleBackButton() {
        print("DEBUG: - handle Back Button")
        navigationController?.popViewController(animated: true)
    }
    @objc func handleResetButton() {
        print("DEBUG: - handle Reset Button")
        let controller = SendMailController()
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
        titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        
        view.addSubview(centralView)
        centralView.translatesAutoresizingMaskIntoConstraints = false
        centralView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        centralView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        centralView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        centralView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50).isActive = true
        
        centralView.addSubview(avatarIamge)
        avatarIamge.translatesAutoresizingMaskIntoConstraints = false
        avatarIamge.centerYAnchor.constraint(equalTo: centralView.centerYAnchor).isActive = true
        avatarIamge.centerXAnchor.constraint(equalTo: centralView.centerXAnchor).isActive = true
        
        centralView.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: avatarIamge.bottomAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: centralView.leftAnchor,constant: 42).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: centralView.rightAnchor, constant: -42).isActive = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        bottomView.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        resetButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        resetButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor,constant: 42).isActive = true
        resetButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -42).isActive = true
    }
}
