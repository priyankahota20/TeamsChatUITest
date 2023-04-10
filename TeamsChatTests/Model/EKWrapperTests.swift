//
//  EKWrapperTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/29/23.
//

import XCTest
@testable import TeamsChat

class EKWrapperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
   
    func test_should_get_data() {
        let startDate = Date()
        let endDate = startDate.tomorrow
        let ekEventData = EKEventsModel(startDate: startDate, endDate: endDate, isAllDay: false, title: "mock", color: UIColor.red.cgColor)
        let dateInterval = DateInterval(start: startDate, end: endDate)
        let ekWrapperData = EKWrapper(eventKitEvent: ekEventData)
        let ekWrapperStartDate = ekWrapperData.startDate
        let ekWrapperEndDate = ekWrapperData.endDate
        let ekWrapperDateInterval = ekWrapperData.dateInterval
        
        XCTAssertEqual(ekWrapperStartDate, dateInterval)
        XCTAssertEqual(ekWrapperEndDate, dateInterval)
        XCTAssertEqual(ekWrapperDateInterval, dateInterval)
        XCTAssertEqual(ekWrapperData.text, "mock")
        XCTAssertFalse(ekWrapperData.isAllDay)
    }
    
    func test_should_make_editable_wrapper() {
        
        let startDate = Date()
        let endDate = startDate.tomorrow
        let ekEventData = EKEventsModel(startDate: startDate, endDate: endDate, isAllDay: false, title: "mock", color: UIColor.red.cgColor)
        let ekWrapperData = EKWrapper(eventKitEvent: ekEventData)
        let editable = ekWrapperData.makeEditable()
        XCTAssertEqual(editable.ekEvent, ekEventData)
    }

}
