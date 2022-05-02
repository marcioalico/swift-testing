//
//  MockSignupWebService.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 5/2/22.
//

@testable import swift_testing_practice

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signUp(with formModel: SignupFromRequestModel,
                completion: @escaping (SignupFormResponseModel?, SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completion(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        } else {
            let responseModel = SignupFormResponseModel(status: "ok")
            completion(responseModel,nil)
        }
    }
    
}
