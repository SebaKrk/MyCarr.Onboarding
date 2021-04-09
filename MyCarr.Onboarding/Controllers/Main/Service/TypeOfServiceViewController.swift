//
//  TypeOfServiceViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 01/04/2021.
//

import UIKit

class TypeOfServiceViewController : UIViewController {
    
    let topView = UIView()
    let secondView = UIView()
    
    private let titleLabel = CostumLabel(title: "Czego\nszukasz ?", size: 42, color: .black, line: 2)
    
    private let carRepairImage = CostumSmallImage(imageName: "CarRepair")
    private let carRepairLabel = CostumLabel(title: "Warsztaty samochodowy", size: 16, color: .black, line: 1)
    private  let carRepairButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Forward"), for: .normal)
        button.addTarget(self, action: #selector(handleCarRepair), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private let vulcanizationImage = CostumSmallImage(imageName: "Vulcanization")
    private let vulcanizationLabel = CostumLabel(title: "Wulkanizacja", size: 16, color: .black, line: 1)
    private  let vulcanizationButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Forward"), for: .normal)
        button.addTarget(self, action: #selector(handleVulcanization), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private let diagnosticStationImage = CostumSmallImage(imageName: "DiagnosticStation")
    private let diagnosticStationLabel = CostumLabel(title: "Stacja diagnostyczna", size: 16, color: .black, line: 1)
    private  let diagnosticStationButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Forward"), for: .normal)
        button.addTarget(self, action: #selector(handleDiagnostic), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private let carWashImage = CostumSmallImage(imageName: "CarWash")
    private let carWashLabel = CostumLabel(title: "Myjnia", size: 16, color: .black, line: 1)
    private  let carWashButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Forward"), for: .normal)
        button.addTarget(self, action: #selector(handleCarWash), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private let dividerView1 = DividerView()
    private let dividerView2 = DividerView()
    private let dividerView3 = DividerView()
    private let dividerView4 = DividerView()
    
    
    //    MARK: - VieDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setUpNavigationBar()
    }
    
    //    MARK: - Action
    
    @objc func handleBackButton() {
        print("DEBUG: Back")
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleCarRepair() {
        print("DEBUG: wyszukaj warsztat")
    }
    
    @objc func handleVulcanization() {
        print("DEBUG: wyszukaj wulkanizacje")
    }
    
    @objc func handleDiagnostic() {
        print("DEBUG: wyszukaj stacje diagnostyczne")
    }
    
    @objc func handleCarWash() {
        print("DEBUG: wyszukaj myjnie")
    }
    
    //    MARK: - SetUpNavigationBar
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBackButton))
    }
    
    //    MARK: - SetupView
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        
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
        titleLabel.topAnchor.constraint(equalTo: topView.topAnchor,constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 42).isActive = true
        
        let stack1 = UIStackView(arrangedSubviews: [carRepairImage,carRepairLabel,carRepairButton])
        stack1.axis = .horizontal
        stack1.spacing = 5
        
        let stack2 = UIStackView(arrangedSubviews: [vulcanizationImage,vulcanizationLabel,vulcanizationButton])
        stack2.axis = .horizontal
        stack2.spacing = 5
        
        let stack3 = UIStackView(arrangedSubviews: [diagnosticStationImage,diagnosticStationLabel,diagnosticStationButton])
        stack3.axis = .horizontal
        stack3.spacing = 5
        
        let stack4 = UIStackView(arrangedSubviews: [carWashImage,carWashLabel,carWashButton])
        stack4.axis = .horizontal
        stack4.spacing = 5
        
        let mainStackView = UIStackView(arrangedSubviews: [stack1,dividerView1,stack2,dividerView2,stack3,dividerView3,stack4,dividerView4])
        mainStackView.axis = .vertical
        mainStackView.spacing = 30
        
        secondView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 46).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor,constant: -46).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: secondView.centerYAnchor).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: secondView.centerXAnchor).isActive = true
    }
}













