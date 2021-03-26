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

struct RegistrationViewModel : AuthenticationViewModel {
    var email : String?
    var name : String?
    var lastName: String?
    var phone : String?
    var password : String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && name?.isEmpty == false
            && lastName?.isEmpty == false
            && phone?.isEmpty == false
            && password?.isEmpty == false
        
    }
}
struct ResetPasswordViewModel: AuthenticationViewModel {
    var email: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
    }
}
