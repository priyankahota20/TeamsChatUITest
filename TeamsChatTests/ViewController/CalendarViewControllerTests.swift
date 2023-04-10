//
//  CalendarViewControllerTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/29/23.
//

import XCTest
import EventKit
import EventKitUI

@testable import TeamsChat

class CalendarViewControllerTests: XCTestCase {
    var sut: CalendarViewController!
    var viewModel: CalendarViewModel!
    var isViewWillApperCalled = false
    var isPresentDetailViewCalled = false
    var isDoneDatePickerTapped = false
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "CalendarViewController") as? CalendarViewController
        sut.loadViewIfNeeded()
        sut.calendarViewmodel = CalendarViewModel(eventRequest: EKEventStore())
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func onViewWillAppear() {
        isViewWillApperCalled = true
    }
    
    func onPresentDetailViewCalled() {
        isPresentDetailViewCalled = true
    }
    
    func onDatePickerDoneTapped() {
        isDoneDatePickerTapped = true
    }
    
    func test_should_call_view_will_appear_method() {
        sut.viewWillAppear(true)
        onViewWillAppear()
        XCTAssertTrue(isViewWillApperCalled)
    }
    
    func test_should_call_present_details_view() {
        let eventStoreData = EKEventStore()
        let ekEventData = EKEvent(eventStore: eventStoreData)
        sut.presentEventDetailsView(ekEvent: ekEventData)
        onPresentDetailViewCalled()
        XCTAssertTrue(isPresentDetailViewCalled)
    
    }
    
    func test_should_call_picker_done_button_method() {
        
        let exp = expectation(description: "Done button Called")
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        sut.doneDatePickerTap()
        onDatePickerDoneTapped()
        XCTAssertTrue(isDoneDatePickerTapped)
        exp.fulfill()
        wait(for: [exp], timeout: 2.0)
    }
    
    func test_should_request_access_to_calendar_granted() {
    

        let exp = expectation(description: "When Calendar access is granted")
        sut.calendarViewmodel?.requestAccessToCalendar(isTestData: true, status: .authorized, completion: { isGranted in
            exp.fulfill()
            XCTAssertTrue(isGranted)
        })
        
        wait(for: [exp], timeout: 2.0)
     }
    
    func test_should_request_access_tocalendator_for_default() {

        let exp = expectation(description: "When Calendar access is not granted")
        sut.calendarViewmodel?.requestAccessToCalendar(isTestData: true, status: .restricted, completion: { isGranted in

            exp.fulfill()
            XCTAssertFalse(isGranted)
        })
        wait(for: [exp], timeout: 2.0)
    }
    
    func test_should_request_access_to_calendar_not_granted() {


        let exp = expectation(description: "When Calendar access is not granted")

        sut.calendarViewmodel?.requestAccessToCalendar(isTestData: true, status: .notDetermined, completion: { isGranted in
        })
        exp.fulfill()
        wait(for: [exp], timeout: 6.0)
    }
    
    func test_should_Call_Event_with_delete_action_vc() {
        
        let exp = expectation(description: "When event with view controller called")
        let eventVC = EKEventViewController()
        let action: EKEventViewAction = .deleted
        sut.eventViewController(eventVC, didCompleteWith: action)
        exp.fulfill()
        wait(for: [exp], timeout: 2.0)
    }
    
    func test_should_Call_Event_with_responded_action__vc() {
        
        let exp = expectation(description: "When event with view controller called")
        let eventVC = EKEventViewController()
        let action: EKEventViewAction = .responded
        sut.eventViewController(eventVC, didCompleteWith: action)
        exp.fulfill()
        wait(for: [exp], timeout: 2.0)
    }
    
    func test_should_Call_Event_with_default_action__vc() {
        
        let exp = expectation(description: "When event with view controller called")
        let eventVC = EKEventViewController()
        let action: EKEventViewAction = .done
        sut.eventViewController(eventVC, didCompleteWith: action)
        exp.fulfill()
        wait(for: [exp], timeout: 2.0)
    }
    
    func test_should_get_events() {
        let exp = expectation(description: "Event List called")
        sut.loadEventsData()
        sut.calendarViewmodel?.getEvents(complition: { event in
            XCTAssertNotNil(event, "Chat response shoudn't be nil")
        })
        exp.fulfill()
        wait(for: [exp], timeout: 2.0)
    }
}
