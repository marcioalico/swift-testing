//
//  MockSignupViewDelegate.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 5/2/22.
//

@testable import swift_testing_practice
import XCTest

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    
    var presenter: SignupPresenterProtocol?
    
    var expectation: XCTestExpectation?
    var signupError: SignupError?
    
    var successfulSignupCallCounter = 0
    func successfulSignup() {
        successfulSignupCallCounter += 1
        expectation?.fulfill()
    }
    
    var errorHandlerCallCounter = 0
    func errorHandler(_ error: SignupError) {
        signupError = error
        errorHandlerCallCounter += 1
        expectation?.fulfill()
    }
}
