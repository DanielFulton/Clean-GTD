//
//  ViewHomeInteractorTests.swift
//  CleanGTDTests
//
//  Created by Daniel Fulton on 2017/10/19.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import XCTest
@testable import CleanGTD
class ViewHomeInteractorTests: XCTestCase {
    var presenter = PresenterSpy()
    func testInteractor() {
        let stub = PresenterSpy()
        let gateway = ViewHomeGateway()
        let interactor = ViewHomeInteractor(presenter: stub, gateway:gateway)
        interactor.interact(request: .update)
        XCTAssert(stub.presentWasCalled, "Interactor should send response to presenter.")
        if let response = stub.response {
            switch response {
            case .update(let model):
                XCTAssert(model.home.categories == [.inbox, .currentActions, .projects, .waitingOn, .somedayMaybe], "Update request should return categories in proper order.")
            }
        } else {
            XCTFail("Interactor should give response to update request.")
        }
    }
    func testForFailure() {
        XCTAssert(true)
    }
    class PresenterSpy : ViewHomePresentable {
        var presentWasCalled = false
        var response:ViewHomeResponse?
        var display: ViewHomeDisplayable?
        func present(response: ViewHomeResponse) {
            self.response = response
            self.presentWasCalled = true
        }
    }
}
