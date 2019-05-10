//
//  DetailViewControllerTests.swift
//  ToDoTDDTests
//
//  Created by Yuta Lin on 2019/5/10.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import XCTest

@testable import ToDoTDD

class DetailViewControllerTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
    
    }
    
    func test_HasTitleLabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        sut.loadViewIfNeeded()
        let titleLabelIsSubView = sut.titleLabel?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(titleLabelIsSubView)
    }
}
