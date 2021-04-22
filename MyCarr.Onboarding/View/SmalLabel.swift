//
//  SmalLabel.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 22/04/2021.
//

import UIKit

class SmallLabel : UILabel {
    init(title: String, size: CGFloat, color: UIColor) {
        super.init(frame: .zero)
        text = title
        font = UIFont(name: "Sen-Regular", size: size)
        textColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

