//
//  ProjectTests.swift
//  CleanGTDTests
//
//  Created by Daniel Fulton on 2017/10/19.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import XCTest
@testable import CleanGTD
class ProjectTests: XCTestCase {
    
    func testThatProjectCanBeCreated() {
        let _ = Project(title:"Project Title", expectedOutcome:"Expected outcome.", lastModifiedDate:Date(), items:[], notes: [])
    }
    
}
