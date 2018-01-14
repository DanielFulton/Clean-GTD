//
//  ViewHomePresenter.swift
//  CleanGTD
//
//  Created by Daniel Fulton on 2017/10/19.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import Foundation

protocol ViewHomePresentable {
    weak var display:ViewHomeDisplayable? { get }
    func present(response:ViewHomeResponse)
}

struct ViewHomePresenter : ViewHomePresentable {
    weak var display: ViewHomeDisplayable?
    func present(response: ViewHomeResponse) {
        switch response {
        case .update(let model):
            let strings:[String] = model.home.categories.map { stringForCategory(category:$0) }
            let model = ViewHomeViewModel.Model(title: "GTD", displayStrings: strings)
            let viewModel = ViewHomeViewModel.update(model)
            display?.display(viewModel: viewModel)
        }
    }
    func stringForCategory(category:Home.Category) -> String {
        switch category {
        case .inbox:
            return "Inbox"
        case .currentActions:
            return "Current Actions"
        case .projects:
            return "Projects"
        case .waitingOn:
            return "Waiting On"
        case .somedayMaybe:
            return "Someday / Maybe"
        }
    }
}
