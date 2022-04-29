//
//  SignUpWebService.swift
//  swift-testing-practice
//
//  Created by Marcio Alico on 4/18/22.
//

import Foundation

protocol SignUpWebServiceProtocol {
    func signUp(with formModel: SignUpFromRequestModel, completion: @escaping (SignupResponseModel?, SignupError?) -> Void)
}

class SignUpWebService: SignUpWebServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        self.urlString = urlString
    }
    
    func signUp(with formModel: SignUpFromRequestModel,
                completion: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(nil, .badUrl)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, SignupError.failedRequest(description: error.localizedDescription))
                return
            }
            
            if let data = data,
               let signUpResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completion(signUpResponseModel,nil)
            } else {
                completion(nil, SignupError.parsingError)
            }
            
        }.resume()
    }
}
