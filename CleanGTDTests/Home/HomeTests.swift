//
//  HomeTests.swift
//  CleanGTDTests
//
//  Created by Daniel Fulton on 2017/10/19.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import XCTest
@testable import CleanGTD
class HomeTests: XCTestCase {
    
    func testHomeCanBeCreated() {
        let _ = Home(categories:[.inbox, .currentActions, .projects, .waitingOn, .somedayMaybe])
    }
    
    
}
