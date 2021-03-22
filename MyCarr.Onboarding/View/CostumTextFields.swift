//
//  CostumTextFields.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 22/03/2021.
//

import UIKit

class CostumTextFields: UITextField {
    
    init(placeHolder: String, isSecure: Bool? = false) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        spacer.widthAnchor.constraint(equalToConstant: 12).isActive = true
        leftView = spacer
        leftViewMode = .always
        
        textColor = .white
        font = UIFont(name: "Sen-Regular", size: 16)
        placeholder = placeHolder
        attributedPlaceholder = NSAttributedString(string: placeHolder ,attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.3)])
        
        let bottomLine = UIView()
        addSubview(bottomLine)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .white
        bottomLine.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
        bottomLine.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        bottomLine.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 10).isActive = true
        
        isSecureTextEntry = isSecure!
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
