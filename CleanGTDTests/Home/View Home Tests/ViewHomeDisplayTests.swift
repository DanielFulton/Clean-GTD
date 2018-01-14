//
//  ViewHomeDisplayTests.swift
//  CleanGTDTests
//
//  Created by Daniel Fulton on 2017/11/10.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import XCTest
@testable import CleanGTD
class ViewHomeDisplayTests: XCTestCase {
    func testThatDisplayReturnsCorrectViewModel() {
        let stub = ViewHomeDisplayStub()
        XCTAssert(stub.viewModel != nil, "View model displayable should receive view model.")
        switch stub.viewModel! {
        case .update(let model):
            XCTAssert(model.displayStrings == ["Inbox", "Current Actions", "Projects", "Waiting On", "Someday / Maybe"], "View Home view model strings should recieve correct strings.")
        }
    }
    class ViewHomeDisplayStub: ViewHomeDisplayable {
        var viewModel:ViewHomeViewModel?
        func display(viewModel: ViewHomeViewModel) {
            self.viewModel = viewModel
        }
        init() {
            let presenter = ViewHomePresenter(display: self)
            let interactor = ViewHomeInteractor(presenter: presenter, gateway:ViewHomeGateway())
            interactor.interact(request: .update)
        }
    }
}
