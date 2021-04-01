//
//  SideMenuVC.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 01/04/2021.
//

import UIKit

class SideMenuVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let selectPhotoButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "DefaultProfileImage").withRenderingMode(.alwaysOriginal), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 34
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 5
        button.addTarget(self, action: #selector(handleImageButton), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 73).isActive = true
        button.heightAnchor.constraint(equalToConstant: 73).isActive = true
        return button
    }()
    
    let userLabel = CostumLabel(title: "Sebastian", size: 24, color: .white, line: 1)
    
    
    let editUser : UIButton = {
        let button = UIButton()
        button.setTitle("Edytuj Profil", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.heightAnchor.constraint(equalToConstant: 18).isActive = true
        button.addTarget(self, action: #selector(handleEditButton), for: .touchUpInside)
        return button
    }()
    
    let tableview: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    var items = ["Moje pojazdy", "Kupony" , "Ustawienia" , "Pomoc"]
    
//    MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        
    }
    
//    MARK: - Action
    
    @objc func handleImageButton() {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    @objc func handleEditButton() {
        print("DEBUG: edit button")
    }
    
//    MARK: - SetUpView
    
    func setupView() {
        view.backgroundColor = .primaryOrange()
        registerTableView()
    }
    
//    MARK: - TableView
    
    func registerTableView() {
        tableview.reloadData()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.rowHeight = 100
        tableview.backgroundColor = .primaryOrange()
        tableview.separatorColor = .white
        tableview.alwaysBounceVertical = false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont(name: "Sen-Bold", size: 26)
        cell.backgroundColor = .primaryOrange()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableview.deselectRow(at: indexPath, animated: true)
        
        switch items[indexPath.row] {
        case items[0]:
            print("DEBUG: historia pojazdu")
        case items[1]:
            print("DEBUG: kupony")
        case items[2]:
            print("DEBUG: Ustawienia")
        case items[3]:
//            navigationController?.pushViewController(HelpCenterViewController(), animated: true)
            print("DEBUG: pomoc")
//            let navVC = UINavigationController(rootViewController: HelpCenterViewController())
//            navVC.modalPresentationStyle = .fullScreen
//            present(navVC, animated: true )
         
        default:
            break
        }
    }
//    MARK: - Constraints
    
    func setupConstraints() {
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        containerView.addSubview(selectPhotoButton)
        selectPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        selectPhotoButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        selectPhotoButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        
        containerView.addSubview(userLabel)
        userLabel.textColor = .white
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -5).isActive = true
        userLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 10).isActive = true
        
        containerView.addSubview(editUser)
        editUser.translatesAutoresizingMaskIntoConstraints = false
        editUser.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: -5).isActive = true
        editUser.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
}

// MARK: - UIImagePickerControllerDelegate

extension SideMenuVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        selectPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        selectPhotoButton.imageView?.contentMode = .scaleToFill
        
        dismiss(animated: true, completion: nil)
    }
}
