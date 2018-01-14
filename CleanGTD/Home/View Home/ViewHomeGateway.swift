//
//  ViewHomeGateway.swift
//  CleanGTD
//
//  Created by Daniel Fulton on 2017/11/10.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import Foundation

protocol HomeGateway {
    func fetchHome(completion:@escaping(_ home:Home) -> Void)
}

struct ViewHomeGateway: HomeGateway {
    func fetchHome(completion:@escaping (_ home:Home) -> Void) {
        let home = Home(categories: [.inbox,
                                     .currentActions,
                                     .projects,
                                     .waitingOn,
                                     .somedayMaybe])
        completion(home)
    }
}
