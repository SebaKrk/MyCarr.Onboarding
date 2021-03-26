//
//  AztecCodeViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 25/03/2021.
//

// AztecCodeViewController

import UIKit

class AztecCodeViewController : UIViewController {
    
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
    
    private let titleLabel = CostumLabel(title: "Zeskanuj\nkod AZTEC", size: 48, color: .black, line: 0)
    
    private let imageAZTEC : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "AZTEC").withRenderingMode(.alwaysOriginal))
        return image
    }()
    private let skanCodeButton : CostumButton = {
        let button = CostumButton(title: "Skanuj kod AZTEC", color: .primaryOrange(), textColor: .white, enable: false, type: .system)
        button.addTarget(self, action: #selector(handleSkanCodeButton), for: .touchUpInside)
        return button
    }()
    
    private let enterDataButton : CostumButton = {
        let button = CostumButton(title: "Wpisz dane ręcznie", color: .white, textColor: .primaryOrange(), enable: false, type: .system)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.primaryOrange().cgColor
        button.addTarget(self, action: #selector(handleEnterDataButton), for: .touchUpInside)
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
    
    //    MARK: VieDidLoad
    
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
    @objc func handleSkanCodeButton() {
        
    }
    @objc func handleEnterDataButton() {
        
    }
    @objc func handleSkipButton() {
        print("DEBUG: Skip Button")
        
        let controller = MainViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //    MARK: - SetupView
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    
        view.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
               
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
    //    MARK: - SetupConstraints
        
    func setupConstraints() {
        topView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 16).isActive = true
        
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 42).isActive = true
        
        centerView.addSubview(imageAZTEC)
        imageAZTEC.translatesAutoresizingMaskIntoConstraints = false
        imageAZTEC.centerXAnchor.constraint(equalTo: centerView.centerXAnchor).isActive = true
        imageAZTEC.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true
        imageAZTEC.widthAnchor.constraint(equalToConstant: 224).isActive = true
        imageAZTEC.heightAnchor.constraint(equalToConstant: 202).isActive = true
        
        bottomView.addSubview(skanCodeButton)
        skanCodeButton.translatesAutoresizingMaskIntoConstraints = false
        skanCodeButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        skanCodeButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        skanCodeButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 46).isActive = true
        skanCodeButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -46).isActive = true
        
        bottomView.addSubview(enterDataButton)
        enterDataButton.translatesAutoresizingMaskIntoConstraints = false
        enterDataButton.topAnchor.constraint(equalTo: skanCodeButton.bottomAnchor, constant: 10).isActive = true
        enterDataButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 46).isActive = true
        enterDataButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -46).isActive = true
    
        bottomView.addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.topAnchor.constraint(equalTo: enterDataButton.bottomAnchor,constant: 10).isActive = true
        skipButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 46).isActive = true
        skipButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -46).isActive = true
    
    }
    
    //    MARK: - Helper
    
}


