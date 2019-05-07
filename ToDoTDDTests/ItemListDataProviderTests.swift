//
//  ItemListDataProviderTests.swift
//  ToDoTDDTests
//
//  Created by Yuta Lin on 2019/5/7.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import XCTest

@testable import  ToDoTDD

class ItemListDataProviderTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func test_NumberOfSections_IsTwo() {
        let sut = ItemListDataProvider()
        let tableView = UITableView()
        tableView.dataSource = sut
        
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func test_NumberOfRows_Section1_isToDoCount() {
        let sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        let tableView = UITableView()
        tableView.dataSource = sut
        
        sut.itemManager?.addItem(item: ToDoItem(title: "Foo"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        sut.itemManager?.addItem(item: ToDoItem(title: "Bar"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
}
