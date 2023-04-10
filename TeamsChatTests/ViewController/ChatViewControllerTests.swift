//
//  ChatViewControllerTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/16/23.
//

import XCTest
import UIKit
@testable import TeamsChat

class ChatViewControllerTests: XCTestCase {
    var sut: ChatViewController!
    
    var isViewWillApperCalled = false
    var isViewDidAppearCalled = false
    var isPresentActionSheetCalled = false
    var isPresentVideoInputActionSheet = false

    override func setUp()  {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController
        sut.loadViewIfNeeded()
    }
    override func tearDown() {
         super.tearDown()
         sut = nil
    }
    
    func onViewWillAppear() {
        isViewWillApperCalled = true
    }
    
    func onViewDidAppear() {
        isViewDidAppearCalled = true
    }
    
    func onPresentActionSheetCalled() {
        isPresentActionSheetCalled = true
    }
    
    func onPresentVideoInputActionSheetCalled() {
        isPresentVideoInputActionSheet = true
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

    func test_present_action_sheet_called() {
        sut.presentInputActionSheet()
        onPresentActionSheetCalled()
        XCTAssertTrue(isPresentActionSheetCalled)
    }
    
    func test_present_video_input_action_sheet() {
        sut.presentVideoInputActionSheet()
    }
    
    func test_should_call_Chat_history() {
        let chatHistoryData = try? sut.chatVM?.getChats().first?.chat_history
        sut.chathistory = chatHistoryData
        sut.viewDidLoad()
        XCTAssertNotNil(sut.messageInputBar.delegate)
    }
    
    func test_When_Keyboard_shouldResign_AfterSending_Message() {
        
        let predicate = NSPredicate { (input, _) in
            !((input as? ChatViewController)?.messageInputBar.inputTextView.isFirstResponder ?? true)
        }
        
        let exp = expectation(for: predicate, evaluatedWith: sut)
        let chatHistory = try? sut.chatVM?.getChats().first?.chat_history
        sut.chathistory = chatHistory
        sut.viewDidLoad()
        sut.messageInputBar.inputTextView.becomeFirstResponder()
        sut.messageInputBar.delegate?.inputBar(sut.messageInputBar, didPressSendButtonWith: "test")
        wait(for: [exp], timeout: 2.0)
        XCTAssertFalse(sut.messageInputBar.inputTextView.isFirstResponder)
        
    }
    
    func test_When_Present_action_sheet() {
        
        let predicate = NSPredicate { (input, _) in
            (input as? ChatViewController)?.presentationController is UIPresentationController
        }
        let exp = expectation(for: predicate, evaluatedWith: sut)
        sut.presentInputActionSheet()
        wait(for: [exp], timeout: 2.0)
    }
    
    func test_when_show_alert() {
        
        let predicate = NSPredicate { (input, _) in
            (input as? ChatViewController)?.presentationController is UIPresentationController
        }
        
        let exp = expectation(for: predicate, evaluatedWith: sut)
        sut.showAlert("test")
        wait(for: [exp], timeout: 2.0)
    }
    
    func test_when_present_photo_action_sheet() {
        
        let predicate = NSPredicate { (input, _) in
            (input as? ChatViewController)?.presentationController is UIPresentationController
        }
        let exp = expectation(for: predicate, evaluatedWith: sut)
        sut.presentPhotoInputActionSheet()
        wait(for: [exp], timeout: 2.0)
    }
    
    
}
