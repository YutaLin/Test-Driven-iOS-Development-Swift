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
    
    func test_HasDateTextField() {
        let dateTextFieldIsSubView = sut.dateTextField?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(dateTextFieldIsSubView)
    }
    
    func test_HasLocationTextField() {
        let locationTextFieldIsSubView = sut.locationTextField?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(locationTextFieldIsSubView)
    }
    
    func test_HasAddressTextField() {
        let addressTextFieldIsSubView = sut.addressTextField?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(addressTextFieldIsSubView)
    }
    
    func test_HasDescriptionTextField() {
        let descriptionTextFieldIsSubView = sut.descriptionTextField?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(descriptionTextFieldIsSubView)
    }
    
    func test_HasSaveButton() {
        let saveButtonIsSubView = sut.saveButton?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(saveButtonIsSubView)
    }
    
    func test_HasCancelButton() {
        let cancelButtonIsSubView = sut.cancelButton?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(cancelButtonIsSubView)
    }
    
    
}
