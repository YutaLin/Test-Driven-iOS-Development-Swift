//
//  InputViewControllerTests.swift
//  ToDoTDDTests
//
//  Created by Yuta Lin on 2019/5/30.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import XCTest

@testable import ToDoTDD

class InputViewControllerTests: XCTestCase {

    var sut: InputViewController!
    
    override func setUp() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "InputViewController") as? InputViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        
    }
    
    func test_HasTitleTextField() {
        let titleTextFieldIsSubView = sut.titleTextField?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(titleTextFieldIsSubView)
    }
    
    
}
