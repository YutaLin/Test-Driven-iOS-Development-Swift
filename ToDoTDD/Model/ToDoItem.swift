//
//  ToDoItem.swift
//  ToDoTDD
//
//  Created by Yuta Lin on 2019/4/14.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import Foundation

struct ToDoItem {
    let title: String
    let itemDescription: String?
    
    init(title: String, itemDescription: String? = nil) {
        self.title = title
        self.itemDescription = itemDescription
    }
}
