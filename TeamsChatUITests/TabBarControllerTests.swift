//
//  TabBarControllerTests.swift
//  TeamsChatUITests
//
//  Created by Capgemini-DA161 on 4/9/23.
//

import XCTest

class TabBarControllerTests: XCTestCase {
    let app = XCUIApplication()
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        app.launch()
    }
 
    func test_should_shown_tabBar_buttons_data(){
        let tabBarController = app.tabBars
        
        let firstTabBarBtn = tabBarController.buttons.element(boundBy: 0)
        XCTAssertEqual(firstTabBarBtn.label, "Activity")
        firstTabBarBtn.tap()
        
        let secondTabBarBtn = tabBarController.buttons.element(boundBy: 1)
        XCTAssertEqual(secondTabBarBtn.label, "Chats")
        secondTabBarBtn.tap()
        
        let thirdTabBarBtn = tabBarController.buttons.element(boundBy: 2)
        XCTAssertEqual(thirdTabBarBtn.label, "Teams")
        thirdTabBarBtn.tap()
        
        let fourthTabBarBtn = tabBarController.buttons.element(boundBy: 3)
        XCTAssertEqual(fourthTabBarBtn.label, "Calendar")
        fourthTabBarBtn.tap()
        
        let FifthtabBarBtn = tabBarController.buttons.element(boundBy: 4)
        XCTAssertEqual(FifthtabBarBtn.label, "More")
        FifthtabBarBtn.tap()        
    }
}
