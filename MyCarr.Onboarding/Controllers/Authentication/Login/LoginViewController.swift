//
//  LoginViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 25/03/2021.
//


import UIKit

class LoginViewController : UIViewController {
    
    let gradientLayer = CAGradientLayer()
    
    private var viewModel = LoginViewModel()
    
    let topView = UIView()
    let centerView = UIView()
    let centerView2 = UIView()
    let bottomView = UIView()
    
    private let titleLabel = CostumLabel(title: "Zaloguj się", size: 48, color: .white, line: 1)
    private let emailTextField = CostumTextFields( placeHolder: "enter your email adress", colorText: .white, bottomLinieColor: .white)
    private let passwordTextField = CostumTextFields(placeHolder: "enter your password", colorText: .white, bottomLinieColor: .white, isSecure: true)
    
    private let forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("nie pamietam hasła >", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Sen-Bold", size: 14)
        button.addTarget(self, action: #selector(handleForgetButton), for: .touchUpInside)
        return button
    }()
    
    private let loginButton : CostumButton = {
        let button = CostumButton(title: "Zaloguj", color: .white, textColor: .primaryOrange(), enable: false, type: .system)
        button.alpha = 0.5
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        return button
    }()
    
    private let registerButton :CostumTextButton = {
        let button = CostumTextButton(text1: "nie masz jeszcze konta?  ", text2: "Zarejestruj się", type: .system)
        button.titleLabel?.numberOfLines = 1
        button.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
        return button
    }()
    
    private let textLabel = CostumLabel(title: "lub kontynuj z: ", size: 12, color: .white, line: 1)
    
    private let mailButton : CostumImageButton = {
        let button = CostumImageButton(image: "mailLogo")
        button.addTarget(self, action: #selector(handleMailButton), for: .touchUpInside)
        return button
    }()
    
    private let facebookButton : CostumImageButton = {
        let button = CostumImageButton(image: "faceBookLogo")
        button.addTarget(self, action: #selector(handleFacebookButton), for: .touchUpInside)
        return button
    }()
    
    private let gmailButton : CostumImageButton = {
        let button = CostumImageButton(image: "gmailLogo")
        button.addTarget(self, action: #selector(handleGmailButton), for: .touchUpInside)
        return button
    }()
    
    private let logoImageLabel : UIImageView = {
        var imageView = UIImageView()
        imageView = UIImageView(image: #imageLiteral(resourceName: "MyCarrrLogo"))
        return imageView
    }()
    
    //    MARK: VieDidLoad
    
    override func viewWillLayoutSubviews() {
        configureGradientBackgraound()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFieldObservers()
        setupConstraints()
    }
    
    //    MARK: - Action
    
    @objc func handleForgetButton() {
        print("DEBUG: - Forget Button")
        let controller = ResetPasswordController()
        navigationController?.pushViewController(controller, animated: true)
    }
    @objc func handleLoginButton() {
        
        guard let email = emailTextField.text else { return}
        guard let password = passwordTextField.text else { return}
        
        print("DEBUG: Login Button \(email),\(password)")
        
        let controller = MainViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    @objc func handleRegisterButton() {
        print("DEBUG: - Register Button")
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    @objc func handleMailButton() {
        print("DEBUG: - Mail Button")
    }
    @objc func handleFacebookButton() {
        print("DEBUG: - Facebook button")
    }
    @objc func handleGmailButton() {
        print("DEBUG: - Gmail button")
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        checkFormStatus()
    }
    //    MARK: - SetupView
    
    func setupView() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        view.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        centerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        centerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        view.addSubview(centerView2)
        centerView2.translatesAutoresizingMaskIntoConstraints = false
        centerView2.topAnchor.constraint(equalTo: centerView.bottomAnchor).isActive = true
        centerView2.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        centerView2.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        centerView2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: centerView2.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    //    MARK: - SetupConstraints
    
    func setupConstraints() {
        
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,forgetPasswordButton])
        stack.axis = .vertical
        stack.spacing = 10
        
        centerView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints =  false
        stack.leftAnchor.constraint(equalTo: centerView.leftAnchor,constant: 46).isActive = true
        stack.rightAnchor.constraint(equalTo: centerView.rightAnchor,constant: -46).isActive = true
        stack.bottomAnchor.constraint(equalTo: centerView.bottomAnchor).isActive = true
        
        let stack2 = UIStackView(arrangedSubviews: [loginButton,registerButton])
        stack2.axis = .vertical
        
        centerView2.addSubview(stack2)
        stack2.translatesAutoresizingMaskIntoConstraints = false
        stack2.centerYAnchor.constraint(equalTo: centerView2.centerYAnchor).isActive = true
        stack2.leftAnchor.constraint(equalTo: centerView2.leftAnchor,constant: 40).isActive = true
        stack2.rightAnchor.constraint(equalTo: centerView2.rightAnchor,constant: -40).isActive = true
        
        let stack3 = UIStackView(arrangedSubviews: [textLabel,mailButton,facebookButton,gmailButton])
        stack3.axis = .horizontal
        stack3.spacing = 10
        
        bottomView.addSubview(stack3)
        stack3.translatesAutoresizingMaskIntoConstraints = false
        stack3.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        stack3.leftAnchor.constraint(equalTo: bottomView.leftAnchor,constant: 46).isActive = true
        stack3.rightAnchor.constraint(equalTo: bottomView.rightAnchor,constant: -46).isActive = true
        
        bottomView.addSubview(logoImageLabel)
        logoImageLabel.translatesAutoresizingMaskIntoConstraints = false
        logoImageLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        logoImageLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
    }
    
    // MARK: - Helpers
    
    func checkFormStatus() {
        if viewModel.formIsValid {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .white
            loginButton.alpha = 1
            loginButton.setTitleColor(.inactiveGray(), for: .normal)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .white
            loginButton.alpha = 0.5
            loginButton.setTitleColor(.primaryOrange(), for: .normal)
        }
    }
    
    func configureTextFieldObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}
