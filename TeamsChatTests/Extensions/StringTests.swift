//
//  StringTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/30/23.
//

import XCTest
@testable import TeamsChat

class StringTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_should_get_localized_string() {
        let string = String()
        let localizedString = string.localized()
        
        let givenString = NSLocalizedString(string, tableName: "Localizable", bundle: .main, value: string, comment: string)
        XCTAssertEqual(localizedString, givenString)
    }

}
