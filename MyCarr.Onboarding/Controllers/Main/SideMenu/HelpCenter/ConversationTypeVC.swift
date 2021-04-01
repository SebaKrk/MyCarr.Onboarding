//
//  ConversationTypeVC.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 01/04/2021.
//


import UIKit

class ConversationTypeVC : UIViewController {
    
    let topView = UIView()
    let secondView = UIView()
    
    private let titleLabel = CostumLabel(title: "Kontakt\nprzez?", size: 40, color: .black, line: 2)
    
    private let phoneImage = CostumSmallImage(imageName: "phonecall")
    private let phoneLabel = CostumLabel(title: "Rozmowa tefoniczna", size: 16, color: .black, line: 1)
    private  let phoneButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Forward"), for: .normal)
        button.addTarget(self, action: #selector(handlePhoneButton), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private let chatImage = CostumSmallImage(imageName: "message")
    private let chatILabel = CostumLabel(title: "Chat", size: 16, color: .black, line: 1)
    private  let chatIButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Forward"), for: .normal)
        button.addTarget(self, action: #selector(handlechatIButton), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private let dividerView1 = DividerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setUpNavigationBar()
    }
    
    //    MARK: - Action
    
    @objc func handlePhoneButton () {
        print("phone button pressed")
    }
    
    @objc func handlechatIButton () {
        print("chat button pressed")
    }
    
    @objc func handleBackButton () {
        print("back button pressed")
        dismiss(animated: true, completion: nil)
    }
    
    //    MARK: - SetUpNavigationBar
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBackButton))
    }
    
    //    MARK: - SetUpView
    
    func setupView() {
        
        view.backgroundColor = .white
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        view.addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        secondView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        secondView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        secondView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
//    MARK: - SetupConstraints
    
    func setupConstraints() {
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 42).isActive = true
        
        let stack1 = UIStackView(arrangedSubviews: [phoneImage,phoneLabel,phoneButton])
        stack1.axis = .horizontal
        stack1.spacing = 10
    
        let stack2 = UIStackView(arrangedSubviews: [chatImage,chatILabel,chatIButton])
        stack2.axis = .horizontal
        stack2.spacing = 10
        
        let mainStackView = UIStackView(arrangedSubviews: [stack1, dividerView1, stack2])
        mainStackView.axis = .vertical
        mainStackView.spacing = 30
        
        secondView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -46).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
