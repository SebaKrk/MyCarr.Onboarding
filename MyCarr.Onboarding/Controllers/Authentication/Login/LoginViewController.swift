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
    
    @objc func handleForgetButton() {
        print("DEBUG: - Forget Button")
        let controller = ResetPasswordController()
        navigationController?.pushViewController(controller, animated: true)
    }
    @objc func handleLoginButton() {
        print("DEBUG: - Login Button")
    }
    @objc func handleRegisterButton() {
        print("DEBUG: - Register Button")
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
    
    //    MARK: - SetupConstraints
    
    func setupConstraints() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
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
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,forgetPasswordButton])
        scrollView.addSubview(stack)
    
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 15
        
        stack.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 10).isActive = true
        stack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 50).isActive = true
        stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -50).isActive = true
        stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
  
        let stack2 = UIStackView(arrangedSubviews: [loginButton,registerButton])
        stack2.axis = .vertical
        stack2.spacing = 5
        
        scrollView.addSubview(stack2)
        stack2.translatesAutoresizingMaskIntoConstraints = false
        stack2.topAnchor.constraint(equalTo: stack.bottomAnchor,constant: 50).isActive = true
        stack2.leftAnchor.constraint(equalTo: stack.leftAnchor).isActive = true
        stack2.rightAnchor.constraint(equalTo: stack.rightAnchor).isActive = true


        let stack3 = UIStackView(arrangedSubviews: [textLabel,mailButton,facebookButton,gmailButton])
        stack3.axis = .horizontal
        stack3.spacing = 10

        scrollView.addSubview(stack3)
        stack3.translatesAutoresizingMaskIntoConstraints = false
        stack3.topAnchor.constraint(equalTo: stack2.bottomAnchor,constant: 50).isActive = true
        stack3.leftAnchor.constraint(equalTo: stack.leftAnchor).isActive = true
        stack3.rightAnchor.constraint(equalTo: stack.rightAnchor).isActive = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        
        bottomView.addSubview(logoImageLabel)
        logoImageLabel.translatesAutoresizingMaskIntoConstraints = false
        logoImageLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        logoImageLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
    }
}
