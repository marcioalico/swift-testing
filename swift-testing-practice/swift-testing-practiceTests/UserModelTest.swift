//
//  UserModelTest.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 4/9/22.
//

import XCTest
@testable import swift_testing_practice

class UserModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
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

