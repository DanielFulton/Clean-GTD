//
//  ViewHomeInteractor.swift
//  CleanGTD
//
//  Created by Daniel Fulton on 2017/10/19.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import Foundation

protocol ViewHomeInteractable {
    var presenter:ViewHomePresentable { get }
    func interact(request:ViewHomeRequest)
}

struct ViewHomeInteractor: ViewHomeInteractable {
    let presenter: ViewHomePresentable
    let gateway: HomeGateway
    func interact(request: ViewHomeRequest) {
        gateway.fetchHome { (home) in
            let model = ViewHomeResponse.Model(home: home)
            self.presenter.present(response: ViewHomeResponse.update(model))
        }
    }
}
