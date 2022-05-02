//
//  ViewController.swift
//  swift-testing-practice
//
//  Created by Marcio Alico on 4/8/22.
//

import UIKit

protocol SignupViewDelegateProtocol: AnyObject {
    var signupError: SignupError? { get set }
    
    func successfulSignup()
    func errorHandler(_ error: SignupError)
}

class ViewController: UIViewController, SignupViewDelegateProtocol {
    
    var signupError: SignupError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func successfulSignup() {
        //
    }
    
    func errorHandler(_ error: SignupError) {
        //
    }
    
}

