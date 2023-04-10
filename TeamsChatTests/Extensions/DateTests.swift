//
//  DateTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/30/23.
//

import XCTest
@testable import TeamsChat

class DateTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_should_get_yesterday_date() {
        let startDate = Date()
        let yesterDayDate = Calendar.current.date(byAdding: .day, value: -1, to: startDate.noon)
        let yesterDay = startDate.yesterday
        XCTAssertEqual(yesterDay, yesterDayDate)
    }

    func test_should_get_twoDays_ago_date() {
        let startDate = Date()
        let twoDaysAgoDate = Calendar.current.date(byAdding: .day, value: -2, to: startDate.noon)
        let twoDayAgo = startDate.twoDaysAgo
        XCTAssertEqual(twoDayAgo, twoDaysAgoDate)
    }
    
    func test_should_get_threeDays_ago_date() {
        let startDate = Date()
        let threeDaysAgoDate = Calendar.current.date(byAdding: .day, value: -2, to: startDate.noon)
        let threeDayAgo = startDate.threeDaysAgo
        XCTAssertEqual(threeDayAgo, threeDaysAgoDate!)
    }

    func test_should_get_fourDays_ago_date() {
        let startDate = Date()
        let fourDaysAgoDate = Calendar.current.date(byAdding: .day, value: -2, to: startDate.noon)
        let fourDayAgo = startDate.fourDaysAgo
        XCTAssertEqual(fourDayAgo, fourDaysAgoDate)
    }
    
    func test_should_get_tomorrow_date() {
        let startDate = Date()
        let tomorrowDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate.noon)
        let tomorrow = startDate.tomorrow
        XCTAssertEqual(tomorrow, tomorrowDate)
    }
    
    func test_should_get_twoHours_ago_date() {
        let startDate = Date()
        let twoHoursAgoTime = Calendar.current.date(byAdding: .hour, value: -2, to: startDate.noon)
        let twoHourAgo = startDate.twoHoursAgo
        XCTAssertEqual(twoHourAgo, twoHoursAgoTime)
    }
    
    func test_should_get_five_Hours_ago_date() {
        let startDate = Date()
        let fiveHoursAgoTime = Calendar.current.date(byAdding: .hour, value: -5, to: startDate.noon)
        let fiveHourAgo = startDate.fiveHoursAgo
        XCTAssertEqual(fiveHourAgo, fiveHoursAgoTime)
    }
    
    func test_should_get_month() {
        let startDate = Date()
        let givenMonth = Calendar.current.component(.month, from: startDate)
        let month = startDate.month
        XCTAssertEqual(month, givenMonth)
    }
    
    func test_should_return_last_Day_of_month() {
        let startDate = Date()
        let givenMonth = Calendar.current.component(.month, from: startDate)
        let tomorrow = startDate.tomorrow
        let givenLastDayOfMonth = (tomorrow.month != givenMonth)
        XCTAssertEqual(startDate.isLastDayOfMonth, givenLastDayOfMonth)
    }
}
