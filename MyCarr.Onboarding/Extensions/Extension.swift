//
//  Extension.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 21/03/2021.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue:CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static func primaryOrange() -> UIColor {
        return UIColor.rgb(red: 235, green: 102, blue: 40)
    }
    static func orangeGradient() -> UIColor {
        return UIColor.rgb(red: 238, green: 75, blue: 65)
    }
    static func inactiveGray() -> UIColor {
        return UIColor.rgb(red: 144, green: 144, blue: 144)
    }
    static func logoOrange() -> UIColor {
        return rgb(red: 205, green: 89, blue: 68)
    }
}

extension UIViewController {
    func configureGradientBackgraound() {
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.primaryOrange().cgColor, UIColor.orangeGradient().cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
}

extension UINavigationController {
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    open override var shouldAutorotate: Bool {
        return false
    }
}
extension UIViewController {
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}
