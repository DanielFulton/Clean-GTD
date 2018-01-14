//
//  ViewHomePresenterTests.swift
//  CleanGTDTests
//
//  Created by Daniel Fulton on 2017/10/19.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import XCTest
@testable import CleanGTD
class ViewHomePresenterTests: XCTestCase {
    func testPresenterOutputViewModel() {
        let display = ViewHomeDisplayStub()
        let presenter = ViewHomePresenter(display: display)
        let home = Home(categories: [.inbox, .currentActions, .projects, .waitingOn, .somedayMaybe])
        let responseModel = ViewHomeResponse.Model(home: home)
        let response = ViewHomeResponse.update(responseModel)
        presenter.present(response: response)
        XCTAssert(display.displayWasCalled, "Presenter should call display.")
        guard let model = display.viewModel else {
            XCTFail("Display should recieve view model.")
            return
        }
        switch model {
        case .update(let model):
            XCTAssert(model.displayStrings == ["Inbox","Current Actions", "Projects", "Waiting On", "Someday / Maybe"], "View model strings must be correct and in proper order.")
        }
    }
    class ViewHomeDisplayStub : ViewHomeDisplayable {
        var displayWasCalled = false
        var viewModel:ViewHomeViewModel?
        func display(viewModel: ViewHomeViewModel) {
            displayWasCalled = true
            self.viewModel = viewModel
        }
    }
}
