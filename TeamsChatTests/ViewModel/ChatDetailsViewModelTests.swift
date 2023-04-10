//
//  ChatDetailsViewModelTests.swift
//  TeamsChatTests
//
//  Created by Capgemini-DA184 on 3/15/23.
//

import XCTest
@testable import TeamsChat

class ChatDetailsViewModelTests: XCTestCase {
    
    var viewModel: ChatDetailsViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ChatDetailsViewModel()
    }
    
    override func setUpWithError() throws {
        viewModel = nil
    }
    
    func testWithValidChatJsonSuccessfullyDecodes() {
        
        XCTAssertNoThrow(try viewModel.getChatDetails(filename: "myJsonFile0", id: 1), "Mapper shouldn't throw an error")
        
        let chatDetailResponse = try? viewModel.getChatDetails(filename: "myJsonFile0", id: 1)
        XCTAssertNotNil(chatDetailResponse, "Chat response shoudn't be nil")
    }
    
    func  test_chatDetail_should_return_nil_when_chatDetails_is_empty() {
        let chatDetailResponse = try? viewModel.getChatDetails(id: 30)
        XCTAssertNil(chatDetailResponse?.isEmpty)
      
    }
    
    func test_should_give_an_error() {
        XCTAssertThrowsError(try viewModel.getChatDetails(filename: "myJsonFile2", id: 30))
    }
    
    func test_ChatDetails_JsonFile_Error_WithInvalidFileName() {
    
        guard let chatDetailResponse = try? viewModel.getChatDetails(filename: "fghdfsgrdthgf", id: 15) else {return}
        XCTAssertTrue(chatDetailResponse.isEmpty)
    }
  
    func  test_temp_chatDetail_should_return_nil_when_chatDetails_is_empty() {
        let chatDetailResponse = try? viewModel.getChatDetails(filename: "myJsonFile3", id: 0)
        XCTAssertNil(chatDetailResponse?.isEmpty)
      
    }
}
