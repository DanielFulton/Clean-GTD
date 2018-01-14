//
//  NoteTests.swift
//  CleanGTDTests
//
//  Created by Daniel Fulton on 2017/10/19.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import XCTest
@testable import CleanGTD
class NoteTests: XCTestCase {
    
    func testThatNoteCanBeCreated() {
        let _ = Note(text:"Test note.")
    }
    
}
