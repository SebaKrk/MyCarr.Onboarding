//
//  CostumRegistrationTF.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 23/03/2021.
//

import UIKit

class CostumTF : UITextField {
    
    init(placeHolder : String) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        spacer.widthAnchor.constraint(equalToConstant: 12).isActive = true
        leftView = spacer
        leftViewMode = .always
        
        textColor = .primaryOrange()
        font = UIFont(name: "Sen-Regular", size: 16)
        placeholder = placeHolder
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
