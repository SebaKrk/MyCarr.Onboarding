//
//  VehicleDataViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 27/03/2021.
//

import UIKit

class VehicleDataViewController : UIViewController {
    
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
    
    
    private let titleLabel = CostumLabel(title: "Dane pojazdu", size: 24, color: .black, line: 1)
    
    private let brandTextField = CostumTF(placeHolder: "wpisz marke pojazdu")
    private let carModelTextField = CostumTF(placeHolder:  "wpisz model")
    private let productionYearTextField = CostumTF(placeHolder: "podaj rok produkcji")
    private let engineCapacityTextFIeld = CostumTF(placeHolder: "wpisz pojemnść silnika")
    private let enginePowerTextField =  CostumTF(placeHolder: "podaj moc Silnika")
    private let fuelTypeTextField =  CostumTF(placeHolder: "rodzaj paliwa")
    
    private let brandlabel = CostumLabel(title: "marka", size: 16, color: .inactiveGray(), line: 1)
    private let carModelLabel = CostumLabel(title: "model", size: 16, color: .inactiveGray(), line: 1)
    private let yearLabel = CostumLabel(title: "rok produkcji", size: 16, color: .inactiveGray(), line: 1)
    private let capacityLabel = CostumLabel(title: "pojemność silnika", size: 16, color: .inactiveGray(), line: 1)
    private let powerLabel = CostumLabel(title: "moc silnika", size: 16, color: .inactiveGray(), line: 1)
    private let fuelLabel = CostumLabel(title: "rodzaj paliwa", size: 16, color: .inactiveGray(), line: 1)
    
    private let doneButton : CostumButton = {
        let button = CostumButton(title: "Gotowe", color: .inactiveGray(), textColor: .white, enable: false, type: .system)
        button.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
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
    @objc func handleDoneButton() {
        
    }
    
    //    MARK: - SetupView
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        topView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        
        view.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    //    MARK: - SetupConstraints
    
    func setupConstraints() {
        
        topView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 16).isActive = true
        
        centerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: centerView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: centerView.leftAnchor,constant: 42).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [ brandTextField,brandlabel, carModelTextField, carModelLabel, productionYearTextField,yearLabel, engineCapacityTextFIeld, capacityLabel, enginePowerTextField,powerLabel, fuelTypeTextField,fuelLabel])
        
        stack.axis = .vertical
        stack.spacing = 10
        
        centerView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        stack.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 46).isActive = true
        stack.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -46).isActive = true
        
        bottomView.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 46).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -46).isActive = true
    }
    
    //    MARK: - Helper
    
}
