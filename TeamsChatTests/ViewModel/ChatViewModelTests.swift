//
//  ChatViewModelTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/14/23.
//

import XCTest
@testable import TeamsChat

class ChatViewModelTests: XCTestCase {
    
    
    override func setUp(){

    }

    func testSuccessfulInit() {
        let testSenderModel = Sender(photoURL: "", senderId: "1", displayName: "test")
        let testChatHistoryModelOne = ChatHistory(sender: testSenderModel, messageId: "10", sentDate: "1998-05-11", kind: "testKind")
        
        let chatHistoryArray = [testChatHistoryModelOne]
        
        XCTAssertNotNil(ChatViewModel(chathistory: chatHistoryArray))
    }
    
    func testWithValidChatJsonSuccessfullyDecodes() {
        let sut = ChatViewModel()
        
        XCTAssertNoThrow(try sut.getChats(filename: "myJsonFile0"), "Mapper shouldn't throw an error")
        let chatResponse = try? sut.getChats(filename: "myJsonFile0")
        XCTAssertNotNil(chatResponse, "Chat response shoudn't be nil")
    }
    
    func testChatJsonFileErrorWithInvalidFileName() {
        let sut = ChatViewModel()
    
        guard let chatResponse = try? sut.getChats(filename: "fhhgfhgfgh") else { return }
        XCTAssertTrue(chatResponse.isEmpty)
    }
    
    func testWithInvalidJsonThrown() {
        let sut = ChatViewModel()

        XCTAssertThrowsError(try sut.getChats(filename: "events"), "An error should be thrown")

    }
    
    func testShouldReturnEmptyArrayForEmptyChatList() {
        let sut = ChatViewModel()
        
        guard let chatResponse = try? sut.getChats(filename: "myJsonFile1") else {return}
        XCTAssertTrue(chatResponse.isEmpty)
        
    }
 
}
