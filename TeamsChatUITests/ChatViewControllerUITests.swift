//
//  ChatViewController.swift
//  TeamsChatUITests
//
//  Created by Capgemini-DA161 on 4/10/23.
//

import XCTest
import UIKit

class ChatViewControllerUITests: XCTestCase {

    let app = XCUIApplication()
    override func setUpWithError() throws {

        continueAfterFailure = false
        app.launch()
    }

    func test_should_open_chat_detail_view() {
        
        app.tabBars["Tab Bar"].buttons["Chats"].tap()
        let table = app.tables["tblConversation"]
        let count = table.cells.count
        XCTAssertTrue(count > 0)
        
        let tableFirstRow = table.staticTexts["Mary"]
        tableFirstRow.tap()
        
        let textView = app.textViews.containing(.staticText, identifier: "Aa").element
        textView.tap()
        textView.typeText("Hello")
        app.buttons["Send"].tap()
        let sendChat = app.collectionViews.staticTexts["Hello"]
        sendChat.tap()        
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

