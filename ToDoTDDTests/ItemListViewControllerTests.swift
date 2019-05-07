//
//  ItemListViewControllerTests.swift
//  ToDoTDDTests
//
//  Created by Yuta Lin on 2019/5/7.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import XCTest

@testable import ToDoTDD

class ItemListViewControllerTests: XCTestCase {
    
    var sut: ItemListViewController!

    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        sut = viewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        
    }
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(sut.tableView?.dataSource is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView?.delegate is ItemListDataProvider)
    }
    
    func test_LoadingView_DataSourceEqualDelegate() {
        XCTAssertEqual(sut.tableView?.dataSource as? ItemListDataProvider, sut.tableView?.delegate as? ItemListDataProvider)
    }

}
