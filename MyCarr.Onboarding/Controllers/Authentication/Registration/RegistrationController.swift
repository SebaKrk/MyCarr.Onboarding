//
//  RegistrationController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 23/03/2021.
//


import UIKit

class RegistrationController : UIViewController {
    
    let topView = UIView()
    let scrollView = UIScrollView()
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
    
    private let termsLabel = CostumLabel(title: "Zgadzam sie z warunkami korzystania z aplikacji", size: 12, color: .inactiveGray(), line: 0)
    
    private let termsSwitch : UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .inactiveGray()
        return sw
    }()
    
    private let localizationLabel = CostumLabel(title:  "Zgadzam się na udostępnienie mojej lokalizacji", size: 12, color: .inactiveGray(), line: 0)
    
    private let LocalizationSwitch : UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .inactiveGray()
        return sw
    }()
    
    private let createButton : CostumButton = {
        let button = CostumButton(title: "Utwórz konto", color: .inactiveGray(), textColor: .white , enable: false, type: .system)
        button.addTarget(self, action: #selector(handleCreateButton), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        
        setupView()
        setupscrollView()
        setupConstraints()
        
    }
    //    MARK: - Action
    
    @objc func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleCreateButton() {
        
    }
    @objc func handleLoginButton() {
        
    }
    
    //    MARK: - SetupView
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        topView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
    }
    
    //    MARK: - SetupConstraints / ScrollView
    
    func setupscrollView() {
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor,constant: 10).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,nameTextField,lastnameTextField,phoneTextField,passwordTextField])
        
        scrollView.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 30
        
        stack.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 25).isActive = true
        stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -25).isActive = true
        stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupConstraints() {
        
        topView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 16).isActive = true
        
        topView.addSubview(registrationLabel)
        registrationLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        registrationLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 42).isActive = true
            
        
        let termsView = UIView()
        termsView.addSubview(termsSwitch)
        termsSwitch.translatesAutoresizingMaskIntoConstraints = false
        termsSwitch.rightAnchor.constraint(equalTo: termsView.rightAnchor).isActive = true
        termsSwitch.centerYAnchor.constraint(equalTo: termsView.centerYAnchor).isActive = true
        
        let localizationView = UIView()
        localizationView.addSubview(LocalizationSwitch)
        LocalizationSwitch.translatesAutoresizingMaskIntoConstraints = false
        LocalizationSwitch.rightAnchor.constraint(equalTo: localizationView.rightAnchor).isActive = true
        LocalizationSwitch.centerYAnchor.constraint(equalTo: localizationView.centerYAnchor).isActive = true
    
        let termsStack = UIStackView(arrangedSubviews: [termsLabel,termsView])
        termsStack.axis = .horizontal
        termsStack.distribution = .fillEqually
        
        let LocalizationStack = UIStackView(arrangedSubviews: [localizationLabel,localizationView])
        LocalizationStack.axis = .horizontal
        LocalizationStack.distribution = .fillEqually
        
        let switchStack = UIStackView(arrangedSubviews: [termsStack,LocalizationStack])
        switchStack.axis = .vertical
        switchStack.distribution = .fillEqually
        
        let buttonStack = UIStackView(arrangedSubviews: [createButton,loginButton])
        buttonStack.axis = .vertical
        
        let bottomStack = UIStackView(arrangedSubviews: [switchStack,buttonStack])
        bottomStack.axis = .vertical
        bottomStack.spacing = 15
        bottomStack.distribution = .fillEqually
        
        bottomView.addSubview(bottomStack)
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        bottomStack.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        bottomStack.leftAnchor.constraint(equalTo: bottomView.leftAnchor,constant: 36).isActive = true
        bottomStack.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor,constant: -36).isActive = true
        bottomStack.bottomAnchor.constraint(equalTo: bottomView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}
