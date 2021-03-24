//
//  RegistrationController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 23/03/2021.
//

import UIKit

class RegistrationController : UIViewController {
    
    let topView = UIView()
    let centerView = UIView()
    let bottomView = UIView()
    
    private let backButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        return button
    }()
    
    private let registrationLabel = CostumLabel(title: "Rejestracja", size: 24, color: .black, line: 1)
    private let emailTextField = CostumRegistrationTF(placeHolder: "E-mail")
    private let nameTextField = CostumRegistrationTF(placeHolder: "Imię")
    private let lastnameTextField = CostumRegistrationTF(placeHolder: "Nazwisko")
    private let phoneTextField = CostumRegistrationTF(placeHolder: "Telefon")
    private let passwordTextField = CostumRegistrationTF(placeHolder: "Hasło")
    
    private let termsLabel = CostumLabel(title: "Zgadzam sie z warunkami korzystania z aplikacji", size: 12, color: .inactiveGray(), line: 2)
    
    private let termsSwitch : UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .inactiveGray()
        return sw
    }()
    
    private let localizationLabel = CostumLabel(title:  "Zgadzam się na udostępnienie mojej lokalizacji", size: 12, color: .inactiveGray(), line: 2)
    
    private let LocalizationSwitch : UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .inactiveGray()
        return sw
    }()
    
    private let createButton : CostumButton = {
        let button = CostumButton(title: "Utwórz konto", color: .inactiveGray(), textColor: .white , enable: false, type: .system)
        button.addTarget(self, action: #selector(handleCreateButton), for: .touchUpInside)
        return button
    }()
    
    let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Masz już konto? Zaloguj się!", for: .normal)
        button.setTitleColor(.primaryOrange(), for: .normal)
        button.titleLabel?.font = UIFont(name: "Sen-Bold", size: 16)
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
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
        setupView()
        setupConstraints()
    }
    
    //    MARK: - Action
    
    @objc func handleBackButton() {
        
    }
    
    @objc func handleCreateButton() {
        
    }
    @objc func handleLoginButton() {
        
    }
    
    //    MARK: - SetupConstraints
    
    func setupView() {
        view.addSubview(topView)
//        topView.backgroundColor = .red
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        topView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        view.addSubview(centerView)
//        centerView.backgroundColor = .green
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
       
        view.addSubview(bottomView)
//        bottomView.backgroundColor = .blue
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: centerView.bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
    }
    func setupConstraints() {
      
        let stack = UIStackView(arrangedSubviews: [registrationLabel, emailTextField, nameTextField, lastnameTextField, phoneTextField, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 30
        stack.distribution = .fillEqually
        
        topView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 16).isActive = true
        
        topView.addSubview(registrationLabel)
        registrationLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        registrationLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 42).isActive = true
        
        centerView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: centerView.topAnchor,constant: 20).isActive = true
        stack.leftAnchor.constraint(equalTo: centerView.leftAnchor, constant: 46).isActive = true
        stack.rightAnchor.constraint(equalTo: centerView.rightAnchor, constant: -46).isActive = true
        
        bottomView.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        createButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor,constant: 42).isActive = true
        createButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -42).isActive = true
        
        bottomView.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 5).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
    }
}
