//
//  AuthenticationViewModel.swift
//  MyCarr.Onboarding
//
//  Created by Sebastian Sciuba on 25/03/2021.
//

import Foundation

protocol AuthenticationViewModel {
    var formIsValid : Bool {get}
}

struct LoginViewModel : AuthenticationViewModel {
    var email : String?
    var password : String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
