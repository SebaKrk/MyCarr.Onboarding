//
//  DividerView.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 01/04/2021.
//

import UIKit

class DividerView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = UIColor.lightGray
        heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
