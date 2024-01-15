//
//  UnitTest_MVVM_C_ExampleTests.swift
//  UnitTest-MVVM-C-ExampleTests
//
//  Created by Serkan Kara on 14.01.2024.
//

import XCTest
@testable import UnitTest_MVVM_C_Example

final class UnitTest_MVVM_C_ExampleTests: XCTestCase {

    private var mockService: MockNewsListService!
    private var viewModel: NewsListVM!
    private var view: MockView!
    
    override func setUp() {
        super.setUp()
        mockService = MockNewsListService()
        viewModel = NewsListVMImpl(service: mockService)
        view = MockView()
        viewModel.delegate = view
    }
    
    func testLoad() throws {
        //Given
        let news = try ResourceLoader.loadNews(resource: .news)

        //When
        viewModel.delegate = view
        viewModel.load()
        
        
        //Then
        XCTAssertEqual(view.outputs.count, 3)
        XCTAssertEqual(view.outputs[0], .showLoading(true))
        XCTAssertEqual(view.outputs[1], .showLoading(false))
        XCTAssertEqual(view.outputs[2], .newsList(news))
    }
}

private class MockView: NewsListVMDelegate {
    
    var outputs: [UserInteraction] = []
    
    func handleOutput(output: UnitTest_MVVM_C_Example.UserInteraction) {
        outputs.append(output)
    }
}
