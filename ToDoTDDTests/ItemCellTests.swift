//
//  ItemCellTests.swift
//  ToDoTDDTests
//
//  Created by Yuta Lin on 2019/5/8.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import XCTest

@testable import ToDoTDD

class ItemCellTests: XCTestCase {

    
    override func setUp() {
     
    }

    override func tearDown() {
     
    }
    
    func test_HasNameLabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        controller.loadViewIfNeeded()
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        let cell = tableView?.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! ItemCell
        
        XCTAssertNotNil(cell.titleLabel)
    }

}

extension ItemCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
