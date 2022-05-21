//
//  SignupViewControllerTests.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 5/3/22.
//

import XCTest
@testable import swift_testing_practice

class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        storyboard = nil
        sut = nil
    }

    func testSignupViewController_WhenCreated_HasTextFieldsEmpty() {
        XCTAssertEqual(sut.firstNameTextField.text, "")
        XCTAssertEqual(sut.lastNameTextField.text, "")
        XCTAssertEqual(sut.emailTextField.text, "")
        XCTAssertEqual(sut.passwordTextField.text, "")
        XCTAssertEqual(sut.repetedPasswordTextField.text, "")
    }
    
    func testSignupViewController_WhenCreated_HasAButtonAndAction() throws {
        
        let signupButton = try XCTUnwrap(sut.signupButton,
                                         "Button dosen't have a referecing IBOutlet")
        
        let buttonActions = signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside)
        
        XCTAssertEqual(buttonActions?.count, 1)
        XCTAssertEqual("signUpAction", buttonActions?.first)
    }
    
    func testSignupViewController_WhenSignupButtonTapped_CallsPresenter() {
        // Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator,
                                                      webService: mockSignupWebService,
                                                      viewDelegate: mockSignupViewDelegate)
        
        sut.presenter = mockSignupPresenter
        
        // Act
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignupPresenter.proccessUserSignUpCalled)
    }
        
}
