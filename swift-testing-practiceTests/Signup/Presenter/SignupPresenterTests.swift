//
//  SignupPresenterTests.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 5/2/22.
//

import XCTest
@testable import swift_testing_practice

class SignupPresenterTests: XCTestCase {
    
    var sut: SignupPresenter!
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    
    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Marcio",
                                              lastName: "Alico",
                                              email: "marcioalico@gmail.com",
                                              password: "password",
                                              repeatPassword: "password")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webService: mockSignupWebService,
                              viewDelegate: mockSignupViewDelegate)
    }
    
    override func tearDown() {
        sut = nil
        signupFormModel = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        mockSignupModelValidator = nil
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        
        // Act
        sut.proccessUserSignUp(signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated)
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange
        
        // Act
        sut.proccessUserSignUp(signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled)
    }
    
    func testSignupPresenter_WhenSignupOperationSuccess_ShouldCallOnSuccessViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfulSignup() method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        
        // Act
        sut.proccessUserSignUp(signupFormModel)
        self.wait(for: [myExpectation], timeout: 3)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCallCounter, 1)
    }
    
    
    func testSignupPresenter_WhenSignupOperationFails_ShouldCallOnErrorViewDelegate() {
        let errorExpectation = expectation(description: "Exxpected the errorHandler() method to be called")
        mockSignupViewDelegate.expectation = errorExpectation
        
        mockSignupWebService.shouldReturnError = true
        sut.proccessUserSignUp(signupFormModel)
        self.wait(for: [errorExpectation], timeout: 3)
        
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCallCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCallCounter, 1)
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
    }
}
