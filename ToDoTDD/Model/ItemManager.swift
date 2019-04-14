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
    
    private var toDoItems = [ToDoItem]()
    
    func addItem(item: ToDoItem) {
        toDoCount += 1
        toDoItems.append(item)
    }
    
    func itemAtIndex(_ index: Int) -> ToDoItem {
        return toDoItems[index]
    }
}
