//
//  ViewHomeBoundary.swift
//  CleanGTD
//
//  Created by Daniel Fulton on 2017/10/19.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import Foundation

enum ViewHomeRequest {
    case update
}

enum ViewHomeResponse {
    case update(Model)
    struct Model {
        let home:Home
    }
}

enum ViewHomeViewModel {
    case update(Model)
    struct Model {
        let title:String
        let displayStrings:[String]
    }
}

