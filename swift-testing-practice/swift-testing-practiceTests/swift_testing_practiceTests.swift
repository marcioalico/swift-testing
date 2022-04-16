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
        super.setUp()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here.
        // This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - CLASS tearDown method
    override class func tearDown() {
        // It is called after all methods complete.
        // Perform any overall cleanup here.
        super.tearDown()
    }

}
