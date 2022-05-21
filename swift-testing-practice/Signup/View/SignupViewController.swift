//
//  SignupViewController.swift
//  swift-testing-practice
//
//  Created by Marcio Alico on 5/3/22.
//

import UIKit

protocol SignupViewDelegateProtocol: AnyObject {
    var signupError: SignupError? { get set }
    var presenter: SignupPresenterProtocol? { get set }
    
    func successfulSignup()
    func errorHandler(_ error: SignupError)
}

class SignupViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repetedPasswordTextField: UITextField!
    @IBOutlet var signupButton: UIButton!
    
    var signupError: SignupError?
    var presenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenterIfNeeded()
    }
    
    fileprivate func setPresenterIfNeeded() {
        if presenter == nil {
            let modelValidator = SignupFormModelValidator()
            let webService = SignupWebService(urlString: SignupConstants.signUpUrl)
            
            presenter = SignupPresenter(formModelValidator: modelValidator,
                                        webService: webService,
                                        viewDelegate: self)
        }
    }
    
    @IBAction func signUpAction() {
        let formModel = SignupFormModel(firstName: firstNameTextField.text ?? "",
                                        lastName: lastNameTextField.text ?? "",
                                        email: emailTextField.text ?? "",
                                        password: passwordTextField.text ?? "",
                                        repeatPassword: repetedPasswordTextField.text ?? "")
        
        presenter?.proccessUserSignUp(formModel)
    }
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfulSignup() {
        let alert = UIAlertController(title: "Success", message: "Signup operation was successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func errorHandler(_ error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "Your request could not be processed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
}
