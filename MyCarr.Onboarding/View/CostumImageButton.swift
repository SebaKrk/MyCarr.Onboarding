//
//  CostumImageButton.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 22/03/2021.
//

import UIKit

class CostumImageButton : UIButton {
    init(image: String) {
        super.init(frame: .zero)
        let imageType = UIImage(imageLiteralResourceName: image)
        setImage(imageType.withRenderingMode(.alwaysOriginal), for: .normal)
        widthAnchor.constraint(equalToConstant: 44).isActive = true
        heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
