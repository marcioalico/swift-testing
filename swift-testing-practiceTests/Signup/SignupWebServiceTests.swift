//
//  SignupWebServiceTests.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 4/18/22.
//

import XCTest
@testable import swift_testing_practice

class SignupWebServiceTests: XCTestCase {
    
    var sut: SignUpWebService!
    var signUpFromRequestModel: SignUpFromRequestModel!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocolImpl.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignUpWebService(urlString: SignupConstants.signUpUrl,
                                   urlSession: urlSession)
        
        signUpFromRequestModel = SignUpFromRequestModel(firstName: "Marcio",
                                                            lastName: "Alico",
                                                            email: "m@malico.com",
                                                            password: "1234")
    }
    
    override func tearDown() {
        sut = nil
        signUpFromRequestModel = nil
        MockURLProtocolImpl.stubResponseData = nil
        MockURLProtocolImpl.error = nil
    }
    
    func testSignupWebService_whenGivenSuccessfullResponse_returnsSuccess() {
        // arrange
        let jsonStringMockedResponse = "{\"status\":\"ok\"}"
        MockURLProtocolImpl.stubResponseData = jsonStringMockedResponse.data(using: .utf8)
 
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        //Act
        sut.signUp(with: signUpFromRequestModel) { responseModel, error in
            // Asert
            XCTAssertEqual(responseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_whenRevicedDifferentJSONResponse_returnsError() {
        // arrange
        let jsonStringMockedResponse = "{\"path\":\"users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocolImpl.stubResponseData = jsonStringMockedResponse.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        //Act
        sut.signUp(with: signUpFromRequestModel) { responseModel, error in
            // Asert
            XCTAssertNil(responseModel?.status)
            XCTAssertEqual(error, SignupError.parsingError)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignUpWebService_WhenEmptyURLStringProvided_ReturnError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignUpWebService(urlString: "")
        
        // Act
        sut.signUp(with: signUpFromRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertEqual(error, SignupError.badUrl)
            XCTAssertNil(signupResponseModel)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignUpWebService_WhenURLRequestFails_ReturnErrorMessageDescription() {
        // Arrange
        let errorDescription = "A localized description por an error"
        MockURLProtocolImpl.error = SignupError.failedRequest(description: errorDescription)
        
        let expectation = self.expectation(description: "A failed Request expectation")
        //expectation.assertForOverFulfill = false
        
        // Act
        sut.signUp(with: signUpFromRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertEqual(error, SignupError.failedRequest(description: error?.localizedDescription ?? ""))
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
}

/*
class MockWebService: SignUpWebServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        self.urlString = urlString
    }
    
    func signUp(with formModel: SignUpFromRequestModel,
                completion: @escaping (SignupResponseModel?,
                                       SignupError?) -> Void) {
        
        let mockResponse = SignupResponseModel(status: "ok")
        completion(mockResponse, nil)
    }
}
 */
