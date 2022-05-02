//
//  SignupPresenter.swift
//  swift-testing-practice
//
//  Created by Marcio Alico on 5/2/22.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var viewDelegate: SignupViewDelegateProtocol?
    
    init(formModelValidator: SignupModelValidatorProtocol,
         webService: SignupWebServiceProtocol,
         viewDelegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.viewDelegate = viewDelegate
    }
    
    func proccessUserSignUp(_ formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(formModel.lastName) {
            return
        }
        
        if !formModelValidator.isPasswordValid(formModel.password) {
            return
        }
        
        if !formModelValidator.isEmailValid(formModel.email) {
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
