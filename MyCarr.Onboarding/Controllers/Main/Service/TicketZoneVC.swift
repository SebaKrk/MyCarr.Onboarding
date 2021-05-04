//
//  TicketZoneVC.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 04/05/2021.
//

import UIKit

class TicketZoneVC : UIViewController {
    
    private let titleLabel = CostumLabel(title: "Czas ważności biletu", size: 24, color: .black, line: 1)
    
    private let topView = UIView()
    private let centerView = UIView()
    private let bottomView = UIView()
    
    private let tableView = UITableView()
    private let items = ["Strefa A", "Strefa B", "Strefa C"]
    
    private let cancleButton : SmallButton = {
        let button = SmallButton(name: "Anuluj", type: .system)
        button.addTarget(self, action: #selector(handleCancleButton), for: .touchUpInside)
        return button
    }()
    
    private let applyButton : SmallButton = {
        let button = SmallButton(name: "Zastosuj", type: .system)
        button.addTarget(self, action: #selector(handleApplyButton), for: .touchUpInside)
        return button
    }()
    
//    MARK: - VieDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstrains()
    }
    
    func setupView() {
        view.backgroundColor = .white
    }
//    MARK: - Action
    
    @objc func handleCancleButton() {
        print("DEBUG: handleCancleButton pressed")
    }
    @objc func handleApplyButton() {
        print("DEBUG: handleApplyButton pressed")
    }
    
    
//    MARK: - SetUpConstraints
    
    func setupConstrains() {
        
        
    }
    
}
