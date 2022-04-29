//
//  swift_testing_practiceTests.swift
//  swift-testing-practiceTests
//
//  Created by Marcio Alico on 4/8/22.
//

import XCTest
@testable import swift_testing_practice

class swift_testing_practiceTests: XCTestCase {

    // MARK: - CLASS setUp method
    // It is called before the first test method.
    override class func setUp() {
        // Order of execution: 1
        super.setUp()
    }
    
    override func setUp() {
        // Order of execution: 2
    }
    
    func someTest() {
        // Order of execution: 3
        // example test
    }
    
    override func tearDown() {
        // Order of execution: 4
        // Put teardown code here. This method is called after the invocation of each test method in the class
    }
    
    // MARK: - CLASS tearDown method
    override class func tearDown() {
        // Order of execution: 5
        // It is called after all methods complete.
        // Perform any overall cleanup here.
        super.tearDown()
    }

}
