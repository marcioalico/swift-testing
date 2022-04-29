//
//  SignupFormModel.swift
//  swift-testing-practice
//
//  Created by Marcio Alico on 4/14/22.
//

import Foundation

struct SignupFormModel {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let repeatPassword: String

    func doPasswordsMatch() -> Bool {
        return password == repeatPassword
    }
}
