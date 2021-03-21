//
//  CostumLabel.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 21/03/2021.
//

import UIKit

class CostumLabel : UILabel {
    init(title: String, size: CGFloat,color: UIColor, line: Int) {
        super.init(frame: .zero)
        text = title
        font = UIFont(name: "Sen-ExtraBold", size: size)
        textColor = color
        numberOfLines = line
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

