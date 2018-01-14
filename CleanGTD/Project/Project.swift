//
//  Project.swift
//  CleanGTD
//
//  Created by Daniel Fulton on 2017/10/19.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import Foundation

struct Project {
    let title:String
    let expectedOutcome:String
    let lastModifiedDate:Date
    let items:[Item]
    let notes:[Note]
}
