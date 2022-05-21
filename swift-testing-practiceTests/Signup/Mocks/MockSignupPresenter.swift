//
//  MockSignupPresenter.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 5/3/22.
//

import Foundation
@testable import swift_testing_practice

class MockSignupPresenter: SignupPresenterProtocol{
    
    var proccessUserSignUpCalled: Bool = false
    
    required init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, viewDelegate: SignupViewDelegateProtocol) {
        // TODO
    }
    
    func proccessUserSignUp(_ formModel: SignupFormModel) {
        proccessUserSignUpCalled = true
    }
}
