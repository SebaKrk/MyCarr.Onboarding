//
//  CostumSmallImage.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 01/04/2021.
//

import UIKit

class CostumSmallImage : UIImageView {
    init(imageName: String) {
        super.init(frame: .zero)
        
        image = UIImage(named: imageName)
        
        widthAnchor.constraint(equalToConstant: 32).isActive = true
        heightAnchor.constraint(equalToConstant: 42).isActive = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

