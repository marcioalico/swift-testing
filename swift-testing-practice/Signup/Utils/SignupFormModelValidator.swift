//
//  SignupFormModelValidatorTests.swift
//  swift-testing-practice
//
//  Created by Marcio Alico on 4/16/22.
//

import Foundation

protocol SignupModelValidatorProtocol: AnyObject {
    func isFirstNameValid(_ firstName: String) -> Bool
    func isEmailValid(_ email: String) -> Bool
}

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    // MARK: - First name validations
    func isFirstNameValid(_ firstName: String) -> Bool {
        let valid = !firstNameTooShort(firstName) && !firstNameTooLong(firstName)
        return valid
    }
    
    fileprivate func firstNameTooShort(_ firstName: String) -> Bool {
        return firstName.count < SignupConstants.firstNameMinLenght
    }
    
    fileprivate func firstNameTooLong(_ firstName: String) -> Bool {
        return firstName.count > SignupConstants.firstNameMaxLenght
    }
    
    // MARK: - Email validations
    func isEmailValid(_ email: String) -> Bool {
        let valid = email.contains("@") && email.contains(".")
        return valid
    }
}
