//
//  CarNameController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 25/03/2021.
//

import UIKit

class CarNameController : UIViewController {
    
    let topView = UIView()
    let centerView = UIView()
    let centerView2 = UIView()
    let bottomView = UIView()
    
    private let backButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        return button
    }()

    private let titleLabel = CostumLabel(title: "Brawo\nSebastian", size: 48, color: .black, line: 0)
    private let secondLabel = CostumLabel(title: "Jak nazwiesz swoj\npierwszy pojazd\nw aplikacji?",
                                          size: 24, color: .black, line: 0)
    private let avatarImage = CostumImageView(imageName: "smile2")
    private let carNameTextField = CostumRegistrationTF(placeHolder: "Enter Car name")
    
    private let nextButton : CostumButton = {
        let button = CostumButton(title: "Dalej!", color: .inactiveGray() , textColor: .white, enable: false, type: .system)
        button.addTarget(self, action: #selector(handleCarName), for: .touchUpInside)
        return button
    }()
    private let skipButton : UIButton = {
        let button = UIButton()
        button.setTitle("pomiń >", for: .normal)
        button.setTitleColor(.primaryOrange(), for: .normal)
        button.titleLabel?.font = UIFont(name: "Sen-ExtraBold", size: 16)
        button.addTarget(self, action: #selector(handleSkipButton), for: .touchUpInside)
        return button
    }()
    
    //    MARK: -  VieDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    //    MARK: -  Action
    
    @objc func handleBackButton() {
        print("DEBUG: Back")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleCarName() {
        print("DEBUG: Create Name Car")
    }
    @objc func handleSkipButton() {
        print("DEBUG: skip button")
    }
    
    //    MARK: - SetupView
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        topView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        view.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        view.addSubview(centerView2)
        centerView2.translatesAutoresizingMaskIntoConstraints = false
        centerView2.topAnchor.constraint(equalTo: centerView.bottomAnchor).isActive = true
        centerView2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        centerView2.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: centerView2.bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
    }
    
    //    MARK: - SetupConstraints / ScrollView
    
    func setupConstraints() {
        topView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 16).isActive = true
        
        centerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: centerView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 42).isActive = true
        
        centerView.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        secondLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 42).isActive = true
        
        centerView2.addSubview(avatarImage)
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.centerYAnchor.constraint(equalTo: centerView2.centerYAnchor).isActive = true
        avatarImage.centerXAnchor.constraint(equalTo: centerView2.centerXAnchor).isActive = true
        
        bottomView.addSubview(carNameTextField)
        carNameTextField.translatesAutoresizingMaskIntoConstraints = false
        carNameTextField.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        carNameTextField.leftAnchor.constraint(equalTo: bottomView.leftAnchor,constant: 36).isActive = true
        carNameTextField.rightAnchor.constraint(equalTo: bottomView.rightAnchor,constant: -36).isActive = true
    
        let bottomStack = UIStackView(arrangedSubviews: [nextButton,skipButton])
        bottomStack.axis = .vertical
        bottomStack.distribution = .fillEqually

        bottomView.addSubview(bottomStack)
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        bottomStack.leftAnchor.constraint(equalTo: bottomView.leftAnchor,constant: 36).isActive = true
        bottomStack.rightAnchor.constraint(equalTo: bottomView.rightAnchor,constant: -36).isActive = true
        bottomStack.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        bottomStack.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
    }
    
    //    MARK: - Helper
    
    
    
}
