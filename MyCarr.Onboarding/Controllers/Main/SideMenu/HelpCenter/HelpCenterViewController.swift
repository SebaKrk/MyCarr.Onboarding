//
//  HelpCenterViewController.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 01/04/2021.
//

import UIKit

class HelpCenterViewController : UIViewController {
    
    let topView = UIView()
    let secondView = UIView()
    
    private let titleLabel = CostumLabel(title: "Potrzebujesz\npomocy?", size: 40, color: .black, line: 2)
    
    private let faqImage = CostumSmallImage(imageName: "FAQ")
    private let faqLabel = CostumLabel(title: "Centrum pomocy", size: 16, color: .black, line: 1)
    private  let faqButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Forward"), for: .normal)
        button.addTarget(self, action: #selector(handleFAQ), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private let helpCenterImage = CostumSmallImage(imageName: "HelpCenter")
    private let helpCenterLabel = CostumLabel(title: "Centrum pomocy", size: 16, color: .black, line: 1)
    private  let helpCenterButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Forward"), for: .normal)
        button.addTarget(self, action: #selector(handleHelpButton), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private let historyImage = CostumSmallImage(imageName: "History")
    private let historyLabel = CostumLabel(title: "Historia Zgloszeń", size: 16, color: .black, line: 1)
    private  let historyButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Forward"), for: .normal)
        button.addTarget(self, action: #selector(handleHistoryButton), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private let dividerView1 = DividerView()
    private let dividerView2 = DividerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setUpNavigationBar()
    }
    
    //    MARK: - Action
    
    @objc func handleFAQ() {
        print("DEBUG: FAQ")
    }
    @objc func handleHelpButton() {
        print("DEBUG: Help Center")
        let rootVC = ConversationTypeVC()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true )
    }
    @objc func handleHistoryButton() {
        print("DEBUG: Hotsoty")
    }
    @objc func handleBackButton() {
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
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        
        view.addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        secondView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        secondView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        secondView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    //    MARK: - SetUpConstraints
    
    
    func setupConstraints() {
        
        topView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topView.topAnchor,constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: topView.leftAnchor,constant: 42).isActive = true
        
        let stack1 = UIStackView(arrangedSubviews: [faqImage,faqLabel,faqButton])
        stack1.axis = .horizontal
        stack1.spacing = 10
        
        let stack2 = UIStackView(arrangedSubviews: [helpCenterImage,helpCenterLabel,helpCenterButton])
        stack2.axis = .horizontal
        stack2.spacing = 10
        
        let stack3 = UIStackView(arrangedSubviews: [historyImage,historyLabel,historyButton])
        stack3.axis = .horizontal
        stack3.spacing = 10
        
        let mainStackView = UIStackView(arrangedSubviews: [stack1, dividerView1, stack2 , dividerView2, stack3])
        mainStackView.axis = .vertical
        mainStackView.spacing = 30
        
        secondView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -46).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: secondView.centerYAnchor).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: secondView.centerXAnchor).isActive = true
    }
}
