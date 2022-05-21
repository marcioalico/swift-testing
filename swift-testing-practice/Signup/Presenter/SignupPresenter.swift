//
//  SignupPresenter.swift
//  swift-testing-practice
//
//  Created by Marcio Alico on 5/2/22.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol,
         webService: SignupWebServiceProtocol,
         viewDelegate: SignupViewDelegateProtocol)
    func proccessUserSignUp(_ formModel: SignupFormModel)
}

class SignupPresenter: SignupPresenterProtocol {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var viewDelegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupModelValidatorProtocol,
         webService: SignupWebServiceProtocol,
         viewDelegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.viewDelegate = viewDelegate
    }
    
    func proccessUserSignUp(_ formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(formModel.firstName) {
            viewDelegate?.errorHandler(SignupError.invalidFirstName)
            return
        }
        
        if !formModelValidator.isLastNameValid(formModel.lastName) {
            viewDelegate?.errorHandler(SignupError.invalidLastName)
            return
        }
        
        if !formModelValidator.isPasswordValid(formModel.password) {
            viewDelegate?.errorHandler(SignupError.invalidPassword)
            return
        }
        
        if !formModelValidator.isEmailValid(formModel.email) {
            viewDelegate?.errorHandler(SignupError.invalidEmail)
            return
        }
        
        let requestModel = SignupFromRequestModel(firstName: formModel.firstName,
                                                  lastName: formModel.lastName,
                                                  email: formModel.email,
                                                  password: formModel.password)
        
        webService.signUp(with: requestModel) { [weak self] (responseModel, error) in
            if let error = error {
                self?.viewDelegate?.errorHandler(error)
                return
            }
            
            if let _ = responseModel {
                self?.viewDelegate?.successfulSignup()
                return
            }
        }
    }
    
}
