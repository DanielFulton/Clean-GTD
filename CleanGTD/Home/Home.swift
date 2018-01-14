//
//  Home.swift
//  CleanGTD
//
//  Created by Daniel Fulton on 2017/10/19.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import Foundation

struct Home {
    let categories:[Category]
    enum Category {
        case inbox
        case currentActions
        case projects 
        case waitingOn
        case somedayMaybe
    }
}
