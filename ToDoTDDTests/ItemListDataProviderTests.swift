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
    
    var sut: ItemListDataProvider!
    var tableView: UITableView!
    var controller: ItemListViewController!

    override func setUp() {
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController)
        controller.loadViewIfNeeded()
        
        tableView = controller.tableView
        tableView.dataSource = sut
    }

    override func tearDown() {
        
    }

    func test_NumberOfSections_IsTwo() {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func test_NumberOfRows_Section1_isToDoCount() {
        sut.itemManager?.addItem(item: ToDoItem(title: "Foo"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.itemManager?.addItem(item: ToDoItem(title: "Bar"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_NumberOfRows_Section2_isDoneCount() {
        sut.itemManager?.addItem(item: ToDoItem(title: "Foo"))
        sut.itemManager?.addItem(item: ToDoItem(title: "Bar"))
        sut.itemManager?.checkItemAtIndex(0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        sut.itemManager?.checkItemAtIndex(0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    func test_CellForRow_ReturnsItemCell() {
        sut.itemManager?.addItem(item: ToDoItem(title: "Foo"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ItemCell)
    }
    
    func test_CellForRow_DequeusCellFromTableView() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")

        sut.itemManager?.addItem(item: ToDoItem(title: "Foo"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
}

extension ItemListDataProviderTests {
    
    class MockTableView: UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
}
