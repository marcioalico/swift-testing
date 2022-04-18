//
//  SignupFormModelValidator.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 4/16/22.
//

import XCTest
@testable import swift_testing_practice

class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!
    
    override func setUp() {
        sut = SignupFormModelValidator()
    }
    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
       
        // Act
        let isValid = sut.isFirstNameValid("Marcio")
        
        // Assert
        XCTAssertTrue(isValid)
    }
    
    func testSignupFormValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isValid = sut.isFirstNameValid("Ma")
        
        // Assert
        XCTAssertFalse(isValid)
    }
    
    func testSignupFormValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isValid = sut.isFirstNameValid("Marcioooooo")
        
        // Assert
        XCTAssertFalse(isValid)
    }
    
    func testSignupFormModel_WhenInformationProvided_PasswordsShouldMatch() {
        // Arrange
        let firstName = "Marcio"
        let lastName = "Alico"
        let email = "marcioalico@gmail.com"
        let password = "123456"
        let repeatPassword = "123456"
        let sut = SignupFormModel(firstName: firstName,
                                  lastName: lastName,
                                  email: email,
                                  password: password,
                                  repeatPassword: repeatPassword)
        
        // Act
        let passwordsMatch = sut.doPasswordsMatch()
        
        // Assert
        XCTAssertTrue(passwordsMatch)
    }
    
}
