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

    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        let sut = viewController as! ItemListViewController
        
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_SetsTableVIewDataSource() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        let sut = viewController as! ItemListViewController
        
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.tableView?.dataSource is ItemListDataProvider)
    }

}
