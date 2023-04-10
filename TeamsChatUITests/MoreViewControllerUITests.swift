//
//  MoreViewControllerUITests.swift
//  TeamsChatUITests
//
//  Created by Capgemini-DA161 on 4/9/23.
//

import XCTest

class MoreViewControllerUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        app.launch()
        app.tabBars["Tab Bar"].buttons["More"].tap()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    func test_should_open_more_view_controller(){

        let tabBarController = app.tabBars
        let tabBarMoreBtn = tabBarController.buttons["More"]
        XCTAssertTrue(tabBarMoreBtn.exists)
        XCTAssertEqual(tabBarMoreBtn.label, "More")
        tabBarMoreBtn.tap()
    }
    
    func test_should_click_on_more_button() {

        let moreNavBar = app.navigationBars["More"]
        let moreStaticText = moreNavBar.staticTexts["More"]
        moreStaticText.tap()

        let moreOptions = app.tables
        moreOptions.staticTexts["Calls"].tap()
        app.staticTexts["topBarNavigation_titleLbl"].tap()

        let user = app.buttons["person.crop.rectangle.stack"]
        XCTAssertTrue(user.exists)

        let triangleMark = app.buttons["list.triangle"]
        XCTAssertTrue(triangleMark.exists)

        app.navigationBars["Calls"].buttons["More"].tap()
        moreOptions.staticTexts["More"].tap()
        moreNavBar.buttons["More"].tap()
    }
    
    func test_should_check_edit_button() {
        
        let moreNavBar = app.navigationBars["More"]
        let moreStaticText = moreNavBar.staticTexts["More"]
        moreStaticText.tap()
        
        moreNavBar.buttons["Edit"].tap()
        app.staticTexts["Drag the icons to organize tabs."].tap()
        
        let data = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        data.buttons["Activity"].tap()
        data.buttons["Chats"].tap()
        data.buttons["Teams"].tap()
        data.buttons["Calendar"].tap()
        data.buttons["Calls"].tap()
        app.buttons.containing(.image, identifier: "line.horizontal.3").element.tap()
        app.navigationBars.buttons["Done"].tap()
    }
}
