//
//  ItemManager.swift
//  ToDoTDD
//
//  Created by Yuta Lin on 2019/4/14.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import Foundation

class ItemManager {
    var toDoCount = 0
    let doneCount = 0
    
    func addItem(item: ToDoItem) {
        toDoCount += 1
    }
}
