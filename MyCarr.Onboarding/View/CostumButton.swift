//
//  CostumButton.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 22/03/2021.
//

import UIKit

class CostumButton : UIButton {
    init(title: String, color: UIColor, textColor: UIColor , enable: Bool? , type: ButtonType) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(textColor, for: .normal)
        titleLabel?.font = UIFont(name: "Sen-Bold", size: 18)
        backgroundColor = color
        isEnabled = enable!
        layer.cornerRadius = 25
        heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
