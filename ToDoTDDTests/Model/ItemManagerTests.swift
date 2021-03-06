//
//  ItemManagerTests.swift
//  ToDoTDDTests
//
//  Created by Yuta Lin on 2019/4/14.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import XCTest

@testable import ToDoTDD

class ItemManagerTests: XCTestCase {
    
    var sut: ItemManager!

    override func setUp() {
        sut = ItemManager()
    }

    override func tearDown() {
        
    }
    
    func testToDoCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.toDoCount, 0, "Initially toDo count should be 0")
    }

    func testDoneCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.doneCount, 0, "Initially done count should be 0")
    }
    
    func testToDoCount_AfterAddingOneItem_IsOne() {
        sut.addItem(item: ToDoItem(title: "Test title"))
        XCTAssertEqual(sut.toDoCount, 1, "toDOCount should be 1")
    }

    func testItemAtIndex_ShouldReturnPreviouslyAddedItem() {
        let item = ToDoItem(title: "Item")
        sut.addItem(item: item)
        
        let returnedItem = sut.itemAtIndex(0)
        XCTAssertEqual(item.title, returnedItem.title, "should be the same item")
    }
    
    func testCheckingItem_ChangesCountOfToDOAndOfDoneItems() {
        sut.addItem(item: ToDoItem(title: "First Item"))
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.toDoCount, 0, "toDoCount should be 0")
        XCTAssertEqual(sut.doneCount, 1, "doneCount should be 1")
    }
    
    func tesetCheckinItem_removesItFromTheToDoItemList() {
        let firstItem = ToDoItem(title: "First")
        let secondItem = ToDoItem(title: "Second")
        
        sut.addItem(item: firstItem)
        sut.addItem(item: secondItem)
        
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.itemAtIndex(0).title, secondItem.title)
    }
    
    func testDoneItemAtIndex_ShouldReturnPreviouslyCheckedItem() {
        let item = ToDoItem(title: "Item")
        sut.addItem(item: item)
        sut.checkItemAtIndex(0)
        
        let returnedItem = sut.doneItemAtIndex(0)
        XCTAssertEqual(item, returnedItem, "should be the same item")
    }
    
    func test_RemoveAll_ResultsInCountsBeZero() {
        
        sut.addItem(item: ToDoItem(title: "Foo"))
        sut.addItem(item: ToDoItem(title: "Bar"))
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.toDoCount, 1)
        XCTAssertEqual(sut.doneCount, 1)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 0)
        
    }
    
    func test_Add_WhenItemIsAlreadyAdded_DoesNotIncreaseCount() {
        sut.addItem(item: ToDoItem(title: "Foo"))
        sut.addItem(item: ToDoItem(title: "Foo"))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
}
