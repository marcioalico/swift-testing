//
//  MockSignupModelValidator.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 5/2/22.
//

@testable import swift_testing_practice

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated = false
    var isLastNameValidated = false
    var isEmailValidated = false
    var isPasswordValidated = false
    
    func isFirstNameValid(_ firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(_ lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isEmailValid(_ email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
}
