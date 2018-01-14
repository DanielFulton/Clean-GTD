//
//  ViewHomeGatewayTest.swift
//  CleanGTDTests
//
//  Created by Daniel Fulton on 2017/11/10.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import XCTest
@testable import CleanGTD
class ViewHomeGatewayTest: XCTestCase {
    func testThatGatewayReturnsHome() {
        let expectation = XCTestExpectation(description: "Gateway should return Home asynchronously.")
        let gateway = ViewHomeGateway()
        gateway.fetchHome { (home) in
            XCTAssert(home.categories == [.inbox, .currentActions, .projects, .waitingOn, .somedayMaybe], "ViewHomeGateway should return correct Home categories.")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
}
