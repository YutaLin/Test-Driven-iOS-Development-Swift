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
    var doneCount = 0
    
    private var toDoItems = [ToDoItem]()
    
    func addItem(item: ToDoItem) {
        toDoCount += 1
        toDoItems.append(item)
    }
    
    func itemAtIndex(_ index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    func checkItemAtIndex(_ index: Int) {
        toDoCount -= 1
        doneCount += 1
        
        toDoItems.remove(at: index)
    }
}
