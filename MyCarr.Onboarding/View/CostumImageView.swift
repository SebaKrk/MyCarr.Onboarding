//
//  CostumImageView.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 23/03/2021.
//

import UIKit

class CostumImageView : UIImageView {
    init(imageName: String) {
        super.init(frame: .zero)
        
        image = UIImage(named: imageName)
        widthAnchor.constraint(equalToConstant: 156).isActive = true
        heightAnchor.constraint(equalToConstant: 168).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

