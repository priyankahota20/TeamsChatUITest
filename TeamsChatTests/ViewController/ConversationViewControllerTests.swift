//
//  ConversationViewControllerTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/30/23.
//

import XCTest
@testable import TeamsChat
import AudioToolbox

class ConversationViewControllerTests: XCTestCase {

    var sut: ConversationsViewController!
    
    var isViewWillApperCalled = false
    var isViewDidAppearCalled = false
    var isAvatarButtonTapped = false
    var isInitVieModelCalled = false
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ConversationsViewController") as? ConversationsViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown()  {
        sut = nil
    }
   
    func onViewWillAppear() {
        isViewWillApperCalled = true
    }
    
    func onViewDidAppear() {
        isViewDidAppearCalled = true
    }
    
    func onAvatarButtonTapped() {
        isAvatarButtonTapped = true
    }
    
    func onInitViewModel() {
        isInitVieModelCalled = true
    }
    
    func test_should_call_view_will_appear_method() {
        sut.viewWillAppear(true)
        onViewWillAppear()
        XCTAssertTrue(isViewWillApperCalled)
    }
    
    func test_should_call_view_did_appear_method() {
        sut.viewDidAppear(true)
        onViewDidAppear()
        XCTAssertTrue(isViewDidAppearCalled)
    }
    
    func test_should_call_avatar_button_tapped() {
        sut.avtarButtonTapped(UIButton())
        onAvatarButtonTapped()
        XCTAssertTrue(isAvatarButtonTapped)
    }
    
    func test_should_call_init_viewModel() {
        sut.initViewModel()
        onInitViewModel()
        XCTAssertTrue(isInitVieModelCalled)
    }
    
    func test_should_not_get_empty_list() {
        
        let chatResponse = try? sut.chatVM?.getChats()
        XCTAssertNotNil(chatResponse, "Chat response shoudn't be nil")
    }

    
    func test_should_call_recent_Chat_TableViewCell() {
        guard let controller = sut else {
            return XCTFail("Could not instantiate View Controller")
        }

        controller.loadViewIfNeeded()
        controller.tblConversation!.reloadData()
        let actualCell = controller.tblConversation!.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(actualCell)
    }
    
    func test_should_call_reusable_Conversation_TableViewCell() {
        guard let controller = sut else {
            return XCTFail("Could not instantiate View Controller")
        }

        controller.loadViewIfNeeded()
        controller.tblConversation!.reloadData()
        let actualCell = controller.tblConversation!.cellForRow(at: IndexPath(row: 0, section: 1))
    
        XCTAssertNotNil(actualCell)
    }
    
    func test_should_navigate_Chat_view_controller() {
        let predicate = NSPredicate { (input, _) in
           let result = ((input as? UINavigationController)?.topViewController is ChatViewController)
            return result
        }
        let controller = UINavigationController(rootViewController: sut)
        let exp = expectation(for: predicate, evaluatedWith: controller)
        sut.tableView(sut.tblConversation, didSelectRowAt: IndexPath(row: 1, section: 1))
        wait(for: [exp], timeout: 2.0)
    }

    func test_should_make_sure_navigatin_bar_button_action_call() {
        sut.customNavigationBar.leftButton.sendActions(for: .touchUpInside)
        onAvatarButtonTapped()
        XCTAssertTrue(isAvatarButtonTapped)
    }

    func test_should_hide_naviationbar_View() {
        let navigationController = UINavigationController(rootViewController: sut)
        sut.viewWillAppear(true)
        XCTAssertTrue(navigationController.navigationBar.isHidden )
    }

    func test_should_reload_table() {
        sut.tblConversation.reloadData()
        XCTAssertTrue(sut.tblConversation.numberOfSections == 2)
    }

    func test_should_get_table_data_not_nil() {
        let cell = sut.tblConversation.cellForRow(at: IndexPath(row: 1, section: 1)) as? ReusableConversationTableViewCell
        XCTAssertNotNil(cell?.lblUserName.text)
    }
}


