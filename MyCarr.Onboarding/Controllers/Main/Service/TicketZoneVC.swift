//
//  TicketZoneVC.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 04/05/2021.
//

import UIKit

class TicketZoneVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    private let titleLabel = CostumLabel(title: "Czas ważności biletu", size: 24, color: .black, line: 1)
    
    private let topView = UIView()
    private let centerView = UIView()
    private let bottomView = UIView()
    
    private let tableView = UITableView()
    private let items = ["Strefa A", "Strefa B", "Strefa C"]
    
    private let cancleButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Anuluj", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.primaryOrange(), for: .normal)
        button.titleLabel?.font = UIFont(name: "Sen-Bold", size: 18)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.primaryOrange().cgColor
        button.addTarget(self, action: #selector(handleCancleButton), for: .touchUpInside)
        return button
    }()
    
    private let applyButton :  UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Zastosuj", for: .normal)
        button.backgroundColor = .primaryOrange()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Sen-Bold", size: 18)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(handleApplyButton), for: .touchUpInside)
        return button
    }()
    
//    MARK: - VieDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstrains()
        setupTableView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
//    MARK: - Action
    
    @objc func handleCancleButton() {
        print("DEBUG: handleCancleButton pressed")
        dismiss(animated: true, completion: nil)
    }
    @objc func handleApplyButton() {
        print("DEBUG: handleApplyButton pressed")
    }
    
//    MARK: - SetupTableView
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight  = 150
        tableView.backgroundColor = .white
        tableView.separatorColor = .lightGray
        tableView.alwaysBounceVertical = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont(name:"Sen-Regular", size: 16)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.tintColor = .primaryOrange()
        tableView.cellForRow(at: indexPath)?.backgroundColor = .white
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .white
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
//    MARK: - SetUpConstraints
    
    func setupConstrains() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 42).isActive = true
        
        view.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        centerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        centerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
    
        centerView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: centerView.topAnchor,constant: 30).isActive = true
        tableView.leadingAnchor.constraint(equalTo: centerView.leadingAnchor,constant: 30).isActive = true
        tableView.trailingAnchor.constraint(equalTo: centerView.trailingAnchor,constant: -30).isActive = true
        tableView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor,constant: -30).isActive = true
        
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [cancleButton,applyButton])
        stack.axis = .horizontal
        stack.spacing = 15
        
        cancleButton.widthAnchor.constraint(equalToConstant: 104).isActive = true
        cancleButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        applyButton.widthAnchor.constraint(equalToConstant: 104).isActive = true
        applyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        bottomView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
    }
    
}
