//
//  SignupUITest.swift
//  swift-testing-practiceUITests
//
//  Created by Marcio Alico on 5/11/22.
//

import XCTest

class SignupViewControllerUITest: XCTestCase {

    private var app: XCUIApplication!
    
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repetedPassword: XCUIElement!
    private var signupButton: XCUIElement!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repetedPassword = app.secureTextFields["repetedPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
        
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repetedPassword = nil
        signupButton = nil
    }

        func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
            XCTAssertTrue(firstName.isEnabled)
            XCTAssertTrue(lastName.isEnabled)
            XCTAssertTrue(email.isEnabled)
            XCTAssertTrue(password.isEnabled)
            XCTAssertTrue(repetedPassword.isEnabled)
            XCTAssertTrue(signupButton.isEnabled)
    }
    
    func testSignupViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        firstName.tap()
        firstName.typeText("S")
        
        lastName.tap()
        lastName.typeText("S")
        
        email.tap()
        email.typeText("S")
        
        password.tap()
        password.typeText("S")
        
        repetedPassword.tap()
        repetedPassword.typeText("S")
        
        signupButton.tap()
        
        let emailScreenshot = email.screenshot()
        let emailAttachment = XCTAttachment(screenshot: emailScreenshot)
        emailAttachment.name = "Screebsgit of Email UITextField"
        emailAttachment.lifetime = .keepAlways
        add(emailAttachment)
        
        // Both options give the app screenshot :)
        let currentAppWindow = XCUIScreen.main.screenshot()
        //let currentAppWindow = app.screenshot()
        
        let appWindowAttachment = XCTAttachment(screenshot: currentAppWindow)
        appWindowAttachment.name = "Signup screen"
        appWindowAttachment.lifetime = .keepAlways
        add(appWindowAttachment)
        
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An error alert dialog was not presented.")
    }
    
    func testSignupViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialog() {
        firstName.tap()
        firstName.typeText("Marcio")
        
        lastName.tap()
        lastName.typeText("Alico")
        
        email.tap()
        email.typeText("test@test.com")
        
        password.tap()
        password.typeText("12345678")
        
        repetedPassword.tap()
        repetedPassword.typeText("12345678")
        
        signupButton.tap()
        
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 1), "An success alert dialog was not presented.")
    }

}
