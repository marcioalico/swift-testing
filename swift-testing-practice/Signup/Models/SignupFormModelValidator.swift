//
//  SignupFormModelValidatorTests.swift
//  swift-testing-practice
//
//  Created by Marcio Alico on 4/16/22.
//

import Foundation

protocol SignupModelValidatorProtocol: AnyObject {
    func isFirstNameValid(_ firstName: String) -> Bool
    func isLastNameValid(_ lastName: String) -> Bool
    func isEmailValid(_ email: String) -> Bool
    func isPasswordValid(_ password: String) -> Bool
}

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    func isFirstNameValid(_ firstName: String) -> Bool {
        let isValid = !nameTooShort(firstName) && !nameTooLong(firstName)
        return isValid
    }
    
    func isLastNameValid(_ lastName: String) -> Bool {
        let isValid = !nameTooShort(lastName) && !nameTooLong(lastName)
        return isValid
    }
    
    func isEmailValid(_ email: String) -> Bool {
        let isValid = email.contains("@") && email.contains(".") && email.count > SignupConstants.emailMinLenght
        return isValid
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        let isValid = password.count > SignupConstants.emailMinLenght
        return isValid
    }
    
    // Private funcs
    
    fileprivate func nameTooShort(_ firstName: String) -> Bool {
        return firstName.count < SignupConstants.nameMinLenght
    }
    
    fileprivate func nameTooLong(_ firstName: String) -> Bool {
        return firstName.count > SignupConstants.nameMaxLenght
    }
}
