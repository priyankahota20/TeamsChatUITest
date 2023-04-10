//
//  TeamsChatUITests.swift
//  TeamsChatUITests
//
//  Created by Capgemini-DA161 on 4/10/23.
//

import XCTest

class TeamsChatUITests: XCTestCase {

    var app : XCUIApplication?
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app?.launch()
        
        let chatTabBarBtn = app?.tabBars.buttons["Chats"]
        chatTabBarBtn?.tap()
        let nav = app?.staticTexts["chat"]
        XCTAssertTrue(((nav?.exists) != nil))
    }
    
    
//    func testSearchBar(){
//
//        let search = app?.searchFields["Search"]
//        XCTAssertTrue(((search?.exists) != nil), "search btn not found")
//
//        let cancelBtn = app?.buttons["cancel"]
//        XCTAssertTrue(((cancelBtn?.exists) != nil), "cancel not found")
//
//    }
    
    func test_should_shown_search_button_content() {
        
        let searchField = app?.searchFields["Search"]
        XCTAssertTrue(((searchField?.exists) != nil), "Search button not found")
        
        searchField?.tap()
        searchField?.typeText("Hello")
        XCTAssertEqual(searchField?.value as! String, "Hello")
        
        let cancelButton = app?.buttons["Cancel"]
        XCTAssertTrue(((cancelButton?.exists) != nil), "Cancel button not found")
        XCTAssertTrue(((cancelButton?.isEnabled) != nil), "Cancel button not enabled")
    }
    
    func test_navigation_bar_item_exists(){
        let person = app?.buttons["person.crop.rectangle.stack"]
        XCTAssertTrue(((person?.exists) != nil))
        let check = app?.buttons["list.triangle"]
        XCTAssertTrue(((check?.exists) != nil))
    }
    
    func test_should_check_table_view_exists_or_not(){
        let tableView = app?.tables["table"]
        XCTAssertTrue(((tableView?.exists) != nil))
        
        let chatcell = tableView?.cells["RecentChatTableViewCell"]
        XCTAssertTrue(((chatcell?.exists) != nil))
        
        let conversationcell = tableView?.cells["ResuableConversationTableViewCell"]
        XCTAssertTrue(((conversationcell?.exists) != nil))
    }
    
    func test_should_check_Collection_view_exists_or_not(){
        let tableView = app?.tables["table"]
        XCTAssertTrue(((tableView?.exists) != nil))
        
        let cell = tableView?.cells.element(boundBy: 0)
        XCTAssertTrue(((cell?.exists) != nil))
        
        let collectionView = tableView?.cells["RecentChatTableViewCell"]
        XCTAssertTrue(((cell?.exists) != nil))
        
        let collectionCell = collectionView?.cells["RecentUserCollectionVIewCell"]
        XCTAssertTrue(((collectionCell?.exists) != nil))
    }
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
