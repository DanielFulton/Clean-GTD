//
//  ViewHomeBoundaryTests.swift
//  CleanGTDTests
//
//  Created by Daniel Fulton on 2017/11/10.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import XCTest
@testable import CleanGTD
class ViewHomeBoundaryTests: XCTestCase {
    func testViewHomeRequest() {
        let _ = ViewHomeRequest.update
    }
    func testViewHomeResponse() {
        let home = Home(categories: [])
        let model = ViewHomeResponse.Model(home: home)
        let _ = ViewHomeResponse.update(model)
    }
    func testViewHomeViewModel() {
        let _ = ViewHomeViewModel.update(ViewHomeViewModel.Model(title:"", displayStrings: []))
    }
}
