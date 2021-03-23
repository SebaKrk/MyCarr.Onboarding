//
//  CostumTextButton.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 22/03/2021.
//

import UIKit

class CostumTextButton: UIButton {
    init(text1 : String , text2: String, type: ButtonType) {
        super.init(frame: .zero)
        
        let atts: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87),
                                                    .font: UIFont(name: "Sen-Regular", size: 14)!]
        let attributedTtitle = NSMutableAttributedString(string: text1, attributes: atts)
        let boldAtts: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87),
                                                        .font: UIFont(name: "Sen-ExtraBold", size: 16)!]
        attributedTtitle.append(NSAttributedString(string: text2, attributes: boldAtts))
        setAttributedTitle(attributedTtitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

