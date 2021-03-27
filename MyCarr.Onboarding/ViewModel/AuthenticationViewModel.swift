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

struct CarNameViewModel: AuthenticationViewModel {
    var carName : String?
    
    var formIsValid: Bool {
        return carName?.isEmpty == false
    }
}

struct VehicleDataViewModel: AuthenticationViewModel {
       
    var brand : String?
    var model : String?
    var year : String?
    var capacity : String?
    var power: String?
    var fueal: String?
    
    var formIsValid: Bool {
        return brand?.isEmpty == false
            && model?.isEmpty == false
            && year?.isEmpty == false
            && capacity?.isEmpty == false
            && power?.isEmpty == false
            && fueal?.isEmpty == false
    }
}
