//
//  SignUpFromRequestModel.swift
//  swift-testing-practice
//
//  Created by Marcio Alico on 4/18/22.
//

import Foundation

struct SignupFromRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
