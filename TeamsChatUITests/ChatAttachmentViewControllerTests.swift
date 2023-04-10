//
//  ChatAttachmentViewControllerTests.swift
//  TeamsChatUITests
//
//  Created by Capgemini-DA161 on 4/10/23.
//

import XCTest
import UIKit

class ChatAttachmentViewControllerTests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Chats"].tap()
        app.tables["tblConversation"].staticTexts["Mary"].tap()
        
        let attachementsButton = app.buttons["attachements"]
        XCTAssertTrue(attachementsButton.exists)
        attachementsButton.tap()
        
        let attachments = app.sheets["Attach Media"].scrollViews.otherElements
        attachments.staticTexts["Attach Media"].tap()
    }

    func test_should_open_photo_options_after_click() {
        
        let attachments = app.sheets["Attach Media"].scrollViews.otherElements
        let attachPhoto = attachments.buttons["Photo"]
        XCTAssertTrue(attachPhoto.exists)
        attachPhoto.tap()
        
        app.sheets["Attach Photo"].scrollViews.otherElements.buttons["Camera"].tap()
        app.alerts["Alert"].scrollViews.otherElements.buttons["Ok"].tap()

    }
    
    func test_should_open_video_option_after_click() {
        
        let attachments = app.sheets["Attach Media"].scrollViews.otherElements
        let attachVideo = attachments.buttons["Video"]
        XCTAssertTrue(attachVideo.exists)
        attachVideo.tap()
    }

    func test_should_open_audio_option_after_click() {
        
        let attachments = app.sheets["Attach Media"].scrollViews.otherElements
        let attachAudio = attachments.buttons["Audio"]
        XCTAssertTrue(attachAudio.exists)
        attachAudio.tap()
    }
    
    func test_should_open_cancel_option_after_click() {
        
        let attachments = app.sheets["Attach Media"].scrollViews.otherElements
        let cancelButton = attachments.buttons["Cancel"]
        XCTAssertTrue(cancelButton.exists)
        cancelButton.tap()
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
