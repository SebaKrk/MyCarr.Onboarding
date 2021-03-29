//
//  VehicleViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 29/03/2021.
//

import UIKit

class VehicleViewController : UIViewController {
    
    let topView = UIView()
    let scrollView = UIScrollView()
    let bottomView = UIView()
    
    private var viewModel = VehicleDataViewModel()
    
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
    
    private let fuelTypeTextField2 =  CostumTF(placeHolder: "rodzaj paliwa")
    private let fuelLabel2 = CostumLabel(title: "rodzaj paliwa", size: 16, color: .inactiveGray(), line: 1)
    private let fuelTypeTextField3 =  CostumTF(placeHolder: "rodzaj paliwa")
    private let fuelLabel3 = CostumLabel(title: "rodzaj paliwa", size: 16, color: .inactiveGray(), line: 1)
    
    
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
        configureTextFieldObservers()
    }
    
    //    MARK: - Action
    
    @objc func handleBackButton() {
        print("DEBUG: Back")
        navigationController?.popViewController(animated: true)
    }
    @objc func handleDoneButton() {
        let controller = CarAddedViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == brandTextField {
            viewModel.brand = sender.text
        } else if sender == carModelTextField {
            viewModel.model = sender.text
        } else if sender == productionYearTextField {
            viewModel.year = sender.text
        } else if sender == engineCapacityTextFIeld{
            viewModel.capacity = sender.text
        } else if sender == enginePowerTextField{
            viewModel.power = sender.text
        } else {
            viewModel.fueal = sender.text
        }
        checkFormStatus()
    }
    
    //    MARK: - SetupView
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        topView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
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
        
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 42).isActive = true
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor,constant: 10).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [ brandTextField,brandlabel, carModelTextField, carModelLabel, productionYearTextField,yearLabel, engineCapacityTextFIeld, capacityLabel, enginePowerTextField,powerLabel, fuelTypeTextField,fuelLabel])
        
        scrollView.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        
        stack.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 50).isActive = true
        stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -50).isActive = true
        stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        bottomView.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 46).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -46).isActive = true
    }
    
    //    MARK: - Helper
    func checkFormStatus() {
        if viewModel.formIsValid {
            doneButton.isEnabled = true
            doneButton.backgroundColor = .primaryOrange()
        } else {
            doneButton.isEnabled = false
            doneButton.backgroundColor = .inactiveGray()
        }
    }
    
    func configureTextFieldObservers() {
        brandTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        carModelTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        productionYearTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        engineCapacityTextFIeld.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        enginePowerTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fuelTypeTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
}

