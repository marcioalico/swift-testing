//
//  SignupError.swift
//  swift-testing-practice
//
//  Created by Marcio Alico on 4/18/22.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case badUrl
    case parsingError
    case failedRequest(description: String)
    case invalidFirstName
    case invalidLastName
    case invalidPassword
    case invalidEmail
    case passwordsNotMatch
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .badUrl,
            .parsingError,
            .invalidFirstName,
            .invalidLastName,
            .invalidEmail,
            .invalidPassword,
            .passwordsNotMatch:
            return ""
        }
    }
}
