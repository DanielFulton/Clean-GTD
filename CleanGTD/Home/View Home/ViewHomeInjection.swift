//
//  ViewHomeInjection.swift
//  CleanGTD
//
//  Created by Daniel Fulton on 2017/12/14.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import Foundation

class ViewHomeInjector:  NSObject {
    func interactor(display:ViewHomeDisplayable) -> ViewHomeInteractable {
        let presenter = ViewHomePresenter(display: display)
        return ViewHomeInteractor(presenter: presenter, gateway:ViewHomeGateway())
    }
}
