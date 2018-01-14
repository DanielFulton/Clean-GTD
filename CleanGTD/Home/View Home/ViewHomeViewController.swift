//
//  ViewHomeViewController.swift
//  CleanGTD
//
//  Created by Daniel Fulton on 2017/11/13.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import UIKit

class ViewHomeViewController: UIViewController {
    @IBOutlet var injector: ViewHomeInjector!
    @IBOutlet weak var tableView: UITableView!
    var viewModel:ViewHomeViewModel.Model?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        injector.interactor(display: self).interact(request: .update)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        injector.interactor(display: self).interact(request: .update)
    }
}

extension ViewHomeViewController : ViewHomeDisplayable {
    func display(viewModel: ViewHomeViewModel) {
        switch viewModel {
        case .update(let model):
            self.navigationItem.title = model.title
            self.viewModel = model
            tableView.reloadData()
        }
    }
}

extension ViewHomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.displayStrings.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel!.displayStrings[indexPath.row]
        return cell
    }
}
