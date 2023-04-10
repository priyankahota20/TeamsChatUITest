//
//  ConstantTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/30/23.
//

import XCTest
@testable import TeamsChat

class ConstantTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_twenty_four_hour_time_system() {
        let time = TimeHourSystem.twentyFour
        let hours = time.hours
        XCTAssertEqual(hours, twentyFourHoursArr)
    }

    
    func test_tweleve_hour_time_system () {
        let time = TimeHourSystem.twelve
        let hours = time.hours
        XCTAssertEqual(hours, tweleveHourArr)
    }
}
