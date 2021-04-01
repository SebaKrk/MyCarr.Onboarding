//
//  HomeViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 28/03/2021.
//

import UIKit

class HomeViewController : UIViewController {
    
    let topView = UIView()
    let centerView = UIView()
    let bottomView = UIView()
    
    
    private let titleLabel = CostumLabel(title: "Cześć,\nSebastian!", size: 42, color: .black, line: 2)
    private let secondLabel = CostumLabel(title: "czego potrzebujesz ?", size: 24, color: .black, line: 0)
    
    private let appointmentButton : CostumButton = {
        let button = CostumButton(title: "Umów wizytę", color: .primaryOrange(), textColor: .white, enable: true, type: .system)
        button.addTarget(self, action: #selector(handleAppointmentButton), for: .touchUpInside)
        return button
    }()
    
    private let parkingTickets : CostumButton = {
        let button = CostumButton(title: "Bilety parkingowe", color: .white, textColor: .primaryOrange(), enable: true, type: .system)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.primaryOrange().cgColor
        button.addTarget(self, action: #selector(handleParkingTickets), for: .touchUpInside)
        return button
    }()
    
    private let avatarImage = CostumImageView(imageName: "smile3")
        
//    MARK: - ViewDidLoad
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //    MARK: - Action

    @objc func handleAppointmentButton() {
        print("DEBUG: book app")

        let navVC = UINavigationController(rootViewController: TypeOfServiceViewController())
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true )
    }
    
    @objc func handleParkingTickets() {
        print("DEBUG: buy parking ticket")
    }


    //    MARK: - SetupView
    
    func setupView() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    
        view.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.28).isActive = true
    }
    
    //    MARK: - SetupConstraints
    
    func setupConstraints() {
        
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 42).isActive = true
        
        topView.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        secondLabel.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 42).isActive = true
        
        centerView.addSubview(appointmentButton)
        appointmentButton.translatesAutoresizingMaskIntoConstraints = false
        appointmentButton.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true
        appointmentButton.centerXAnchor.constraint(equalTo: centerView.centerXAnchor).isActive = true
        appointmentButton.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 46).isActive = true
        appointmentButton.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -46).isActive = true
        
        centerView.addSubview(parkingTickets)
        parkingTickets.translatesAutoresizingMaskIntoConstraints = false
        parkingTickets.topAnchor.constraint(equalTo: appointmentButton.bottomAnchor, constant: 20).isActive = true
        parkingTickets.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 46).isActive = true
        parkingTickets.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -46).isActive = true
        
        bottomView.addSubview(avatarImage)
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        avatarImage.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        
    }
}
