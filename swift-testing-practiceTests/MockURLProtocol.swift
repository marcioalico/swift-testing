//
//  MockURLProtocol.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 4/24/22.
//

import Foundation

protocol MockURLProtocol: URLProtocol {
    static var stubResponseData: Data? { get set }
    static var error: Error? { get set }
}

class MockURLProtocolImpl: URLProtocol, MockURLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocolImpl.error {
            self.client?.urlProtocol(self, didFailWithError: error)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocolImpl.stubResponseData ?? Data())
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {    }
}
