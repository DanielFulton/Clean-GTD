//
//  VIewHomeTests.swift
//  VIewHomeTests
//
//  Created by Daniel Fulton on 2017/12/28.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import XCTest
class VIewHomeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let presenter = ViewHomePresenter(display: DIsplayStub())
        let gateway = ViewHomeGateway()
        let interactor = ViewHomeInteractor(presenter:presenter,gateway:gateway)
        XCTAssert(false, "test.")
    }
    class DIsplayStub : ViewHomeDisplayable {
        func display(viewModel: ViewHomeViewModel) {
            
        }
    }
}
