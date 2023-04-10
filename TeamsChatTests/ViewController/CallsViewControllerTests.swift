//
//  CallsViewControllerTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/26/23.
//

import XCTest
import UIKit
@testable import TeamsChat

class CallsViewControllerTests: XCTestCase {
    var sut: CallsViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "CallsViewController") as? CallsViewController
        sut.loadViewIfNeeded()
        
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
