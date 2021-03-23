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
    func setupConstraints() {
        
    }
}
