//
//  CalendarViewModelTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/29/23.
//

import XCTest
import CalendarKit
import EventKit
import EventKitUI
@testable import TeamsChat

class CalendarViewModelTests: XCTestCase {

    var viewModel: CalendarViewModel!
    
    override func setUp() {
        viewModel = CalendarViewModel()
    }

    override func tearDown() {
        viewModel = nil
    }
    
    func testSuccessfulInit() {
        let eventStore = EKEventStore()
        XCTAssertNotNil(CalendarViewModel(eventRequest: eventStore))
    }

    func test_sould_get_events() {
         viewModel.getEvents { events in
            XCTAssertNotNil(events, "event response shoudn't be nil")
        }
    }
    
    func test_should_always_generate_event_from_eventStore() {
        let eventStoreData = EKEventStore()
        let startDate = Date()
        let endDate = startDate.tomorrow
        let ekEventModelData = EKEventsModel(startDate: startDate, endDate: endDate, isAllDay: false, title: "mock", color: UIColor.red.cgColor)
        let eventData = viewModel.generateEvent(storeEvent: eventStoreData, event: ekEventModelData, calendar: .autoupdatingCurrent)
        XCTAssertEqual(eventData.title, "mock")
        XCTAssertEqual(eventData.startDate.description, startDate.description)
        XCTAssertEqual(eventData.endDate.description, endDate.description)
        XCTAssertEqual(eventData.isAllDay, false)
    }

    func test_ShouldCall_present_EkEventVC() {
        let eventStoreData = EKEventStore()
        let startDate = Date()
        let endDate = startDate.tomorrow
        let ekEventModelData = EKEventsModel(startDate: startDate, endDate: endDate, isAllDay: false, title: "mock", color: UIColor.red.cgColor)
        let eventData = viewModel.generateEvent(storeEvent: eventStoreData, event: ekEventModelData, calendar: .autoupdatingCurrent)
        
        let eventViewController = viewModel.presentEKEventViewController(ekEvent: eventData)
        XCTAssertEqual(eventViewController.event, eventData)
        XCTAssertEqual(eventViewController.allowsCalendarPreview, true)
        XCTAssertEqual(eventViewController.allowsEditing, false)
    }
    
    
}
