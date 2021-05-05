//
//  ParkingTicketsVC.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 20/04/2021.
//


import UIKit
import CoreLocation

class ParkingTicketsVC : UIViewController {
    
    let locationManager = CLLocationManager()

    private let titleLabel = CostumLabel(title: "Bilety\nparkingowe", size: 40, color: .black, line: 2)
    
    private let pinImage : UIImageView = {
        var imageView = UIImageView()
        imageView = UIImageView(image: #imageLiteral(resourceName: "Vector").withRenderingMode(.alwaysOriginal))
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        return imageView
    }()
    
    private let currentLocalizationLabel = CostumLabel(title: "City", size: 16, color: .black, line: 1)
    
    private let zoneLabel = SmallLabel(title: "Strefa A", size: 16, color: .black)
    private let zoneButton : SmallButton = {
        let button = SmallButton(name: "Forward", type: .system)
        button.addTarget(self, action: #selector(handleZoneButton), for: .touchUpInside)
        return button
    }()
    
    private let ticketTimeLabel = SmallLabel(title: "Czas ważności biletu", size: 16, color: .black)
    private let ticketTimeButton : SmallButton = {
        let button = SmallButton(name: "Forward", type: .system)
        button.addTarget(self, action: #selector(handleTicketTime), for: .touchUpInside)
        return button
    }()
    private let nextButton : CostumButton = {
        let button = CostumButton(title: "Dalej", color: .primaryOrange(), textColor: .white, enable: false, type: .system)
        button.addTarget(self, action:  #selector(handleNext), for: .touchUpInside)
        return button
    }()
    private let dividerView1 = DividerView()
    private let dividerView2 = DividerView()
    private let dividerView3 = DividerView()
    
//    MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupLocationManager()
    }
    
//    MARK: - Action
    
    @objc func handleZoneButton() {
        print("DEBUG: handle ZoneButton")
        let vc = UINavigationController(rootViewController: TicketZoneVC())
        present(vc, animated: true, completion: nil)
        
    }
    @objc func handleTicketTime() {
        print("DEBUG: handle TicketTime")
        let vc = UINavigationController(rootViewController: TimeTicketZoneVC())
        present(vc, animated: true, completion: nil)
    }
    @objc func handleNext() {
        print("DEBUG: handle Next")
    }
    @objc func handleBackButton() {
        print("DEBUG: handle back")
        dismiss(animated: true, completion: nil)
        
    }
    //    MARK: - SetupView
    
    func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBackButton))
    }
    
    //    MARK: - Location
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    //    MARK: - Constraints
    
    func setupConstraints() {
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 42).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [pinImage,currentLocalizationLabel])
        stack.axis = .horizontal
        stack.spacing = 10
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46).isActive = true
        
        let stack1 = UIStackView(arrangedSubviews: [zoneLabel,zoneButton])
        stack1.axis = .horizontal
        stack1.spacing = 5
        
        let stack2 = UIStackView(arrangedSubviews: [ticketTimeLabel,ticketTimeButton])
        stack2.axis = .horizontal
        stack2.spacing = 5

        let mainStackView = UIStackView(arrangedSubviews: [dividerView1,stack1,dividerView2,stack2,dividerView3])
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 75).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -46).isActive = true
        
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -46).isActive = true
    }
    
}
// MARK: - CLLocationManagerDelegate

extension ParkingTicketsVC : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location, preferredLocale: .current) { (placemarks, error) in
                guard let place = placemarks?.last, error == nil else { return }
                
                var locationFullName = ""
                
                if let country = place.country{
                    locationFullName += country
                }
                if let city = place.locality {
                    locationFullName += ", \(city)"
                }
                self.currentLocalizationLabel.text = locationFullName
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error masage in location: \(error)")
    }
}
