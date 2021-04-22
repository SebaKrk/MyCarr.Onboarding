//
//  SmallButton.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 22/04/2021.
//

import UIKit

class SmallButton : UIButton {
    init(name: String, type: ButtonType) {
        super.init(frame: .zero)
        setImage(UIImage(named: name), for: .normal)
        widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

