//
//  ViewHomeViewControllerTests.swift
//  CleanGTDTests
//
//  Created by Daniel Fulton on 2017/11/13.
//  Copyright © 2017 Daniel Fulton. All rights reserved.
//

import XCTest
@testable import CleanGTD
class ViewHomeViewControllerTests: XCTestCase {
    var viewController:UIViewController?
    override func setUp() {
        viewController = UIStoryboard(name: "ViewHomeViewController", bundle: nil).instantiateViewController(withIdentifier: "ViewHomeViewController")
    }
    func testThatViewHomeViewControllerCanBeCreated() {
        let viewHomeVC:ViewHomeViewController = viewController as! ViewHomeViewController
        XCTAssertNotNil(viewHomeVC, "View home view controller must be creatable.")

    }
    func testThatViewHomeViewControllerIsDisplayable() {
        XCTAssert(viewController is ViewHomeDisplayable, "View Home vc must be displayable.")
    }
    func testDisplayGetsCalledAfterViewDidLoad() {
        let viewHomeVC:ViewHomeViewController = viewController as! ViewHomeViewController
        let _ = viewHomeVC.view // calls viewDidLoad.
        XCTAssertNotNil(viewHomeVC.viewModel, "View home view controller should call sendRequest and receive view model after viewDidLoad")
    }
    func testVIewHomeVIewControllerDataSource() {
        let viewHomeVC:ViewHomeViewController = viewController as! ViewHomeViewController
        let _ = viewHomeVC.view // calls viewDidLoad.
        let items:[Home.Category] = [.inbox, .currentActions, .projects, .waitingOn, .somedayMaybe]
        XCTAssert(viewHomeVC.tableView(viewHomeVC.tableView, numberOfRowsInSection: 0) == items.count, "View home view controller should display correct number of items.")
        XCTAssert(viewHomeVC.tableView.dataSource === viewHomeVC, "View home vc must be set as table view data source.")
    }
    func testViewHomeViewControllerCallsReloadDataOnViewDidLoad() {
        let viewHomeVC:ViewHomeViewController = viewController as! ViewHomeViewController
        let spy = TableViewSpy()
        viewHomeVC.tableView = spy
        //let _ = viewHomeVC.view // calls viewDidLoad.
        let model:ViewHomeViewModel = ViewHomeViewModel.update(ViewHomeViewModel.Model(title:"",displayStrings: []))
        viewHomeVC.display(viewModel: model)
        XCTAssert(spy.reloadDataWasCalled, "View home view controller should call reloadData after display method called.")
    }
    class TableViewSpy : UITableView {
        var reloadDataWasCalled:Bool = false
        override func reloadData() {
            reloadDataWasCalled = true
        }
    }
}
