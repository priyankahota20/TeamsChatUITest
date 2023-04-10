//
//  CalendarUITests.swift
//  TeamsChatUITests
//
//  Created by Capgemini-DA161 on 4/9/23.
//

import XCTest

class CalendarViewControllerUITests: XCTestCase {

    let app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        app.tabBars["Tab Bar"].buttons["Calendar"].tap()
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    func test_should_open_Calendar_view_controller(){

        let tabBarController = app.tabBars
        let tabBarCalendarBtn = tabBarController.buttons["More"]
        XCTAssertTrue(tabBarCalendarBtn.exists)
        XCTAssertEqual(tabBarCalendarBtn.label, "More")
        tabBarCalendarBtn.tap()
    }
    
    func test_should_click_on_Calendar_button() {

        let calendarNavBar = app.navigationBars["Calendar"]
        let calendarStaticText = calendarNavBar.staticTexts["Calendar"]
        calendarStaticText.tap()
    }
    
    func test_calendar_page_exists() {
        let calenderTitle = app.staticTexts["Calendar"]
        XCTAssertTrue(calenderTitle.exists)
    }
}
