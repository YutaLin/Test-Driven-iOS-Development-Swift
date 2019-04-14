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

    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    func testToDoCount_Initially_ShouldBeZero() {
        let sut = ItemManager()
        XCTAssertEqual(sut.toDoCount, 0, "Initially toDo count should be 0")
    }

    func testDoneCount_Initially_ShouldBeZero() {
        let sut = ItemManager()
        XCTAssertEqual(sut.doneCount, 0, "Initially done count should be 0")
    }
}
