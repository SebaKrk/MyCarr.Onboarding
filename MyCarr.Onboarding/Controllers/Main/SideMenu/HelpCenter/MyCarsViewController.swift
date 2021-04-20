//
//  MyCarsViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 20/04/2021.
//

import UIKit

class MyCarsViewController : UIViewController {
    
    let topView = UIView()
    let scrollView = UIScrollView()
    let bottomView = UIView()
    
    private let titleLabel = CostumLabel(title: "Moje pojazdy", size: 42, color: .black, line: 1)
    
    private let carName = CostumInfoLabel(infoText: "Czerwona Strzała")
    private let brandName = CostumInfoLabel(infoText: "KIA")
    private let model = CostumInfoLabel(infoText: "Stonic")
    private let productionYear = CostumInfoLabel(infoText: "2019")
    private let engineCapacity =  CostumInfoLabel(infoText: "1,368")
    private let enginePower = CostumInfoLabel(infoText: "74")
    private let fuelType = CostumInfoLabel(infoText: "benzyna")
    
    private let editButton : CostumButton = {
        let button = CostumButton(title: "Edytuj", color: .primaryOrange(), textColor: .white, enable: true, type: .system)
        button.addTarget(self, action: #selector(handleEditButton), for: .touchUpInside)
        return button
    }()
    //    MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupscrollView()
        setupConstraints()

    }
    
    //    MARK: - ACTION
    
    @objc func handleEditButton() {
        print("DEBUG: Edit button")
        let navVC = ErrorViewController()
        present(navVC, animated: true )
    }
    @objc func handleBackButton() {
        dismiss(animated: true, completion: nil)
    }
    
    //    MARK: - Setup View
    
    func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBackButton))
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        topView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
    }
    
    //    MARK: - Scroll View
    
    func setupscrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor,constant: 10).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        
        
        let stack = UIStackView(arrangedSubviews: [carName,brandName,model,productionYear,engineCapacity,enginePower,fuelType])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 30
        
        scrollView.addSubview(stack)
        stack.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 50).isActive = true
        stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -50).isActive = true
        stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    //    MARK: -  SetupConstraints
    
    func setupConstraints() {
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 42).isActive = true
        
        bottomView.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        editButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        editButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor,constant: 42).isActive = true
        editButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor,constant: -42).isActive = true
    }
    
}
