//
//  CostumInfoLabel.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 20/04/2021.
//

import UIKit

class CostumInfoLabel : UILabel {
    
    init(infoText : String) {
        super.init(frame: .zero)
        
        text = infoText
        textColor = .primaryOrange()
        font = UIFont(name: "Sen-Regular", size: 16)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        let bottomLine = UIView()
        addSubview(bottomLine)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .inactiveGray()
        bottomLine.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
        bottomLine.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        bottomLine.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
