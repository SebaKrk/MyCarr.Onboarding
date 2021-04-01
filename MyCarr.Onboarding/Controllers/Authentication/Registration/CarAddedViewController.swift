//
//  CarAddedViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 27/03/2021.
//

import UIKit

class CarAddedViewController: UIViewController {
    
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
    
    private let titleLabel = CostumLabel(title: "Twój pojazd\nzostał\ndodany!", size: 48, color: .black, line: 3)
    private let scecondLabel = CostumLabel(title:  "Umawiamy wizytę ?", size: 24, color: .black, line: 1)
    
    private let avatarImage = CostumImageView(imageName: "smile3")
    
    private let searchButton : CostumButton = {
        let button = CostumButton(title: "Szukaj", color: .primaryOrange(), textColor: .white, enable: true, type: .system)
        button.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        return button
    }()
    
    private let secondButton : UIButton = {
        let button = UIButton()
        button.setTitle("Nie, dziękuje >", for: .normal)
        button.setTitleColor(.primaryOrange(), for: .normal)
        button.titleLabel?.font = UIFont(name: "Sen-Bold", size: 16)
        button.addTarget(self, action: #selector(handlesecondButton), for: .touchUpInside)
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
    @objc func handleSearchButton() {
        print("DEBUG: Search")
        let navVC = UINavigationController(rootViewController: TypeOfServiceViewController())
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true )
        
    }
    
    @objc func handlesecondButton() {
        print("DEBUG: Dismis")
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
 
    //    MARK: - SetupView
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
    
        view.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    //    MARK: - SetupConstraints
    
    func setupConstraints() {
        topView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 16).isActive = true
        
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: centerView.leftAnchor,constant: 42).isActive = true
        
        centerView.addSubview(scecondLabel)
        scecondLabel.translatesAutoresizingMaskIntoConstraints = false
        scecondLabel.topAnchor.constraint(equalTo: centerView.topAnchor).isActive = true
        scecondLabel.leftAnchor.constraint(equalTo: centerView.leftAnchor,constant: 42).isActive = true
        
        centerView.addSubview(avatarImage)
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true
        avatarImage.centerXAnchor.constraint(equalTo: centerView.centerXAnchor).isActive = true
        
        bottomView.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        searchButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 46).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -46).isActive = true
        
        bottomView.addSubview(secondButton)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 10).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
    }
}
