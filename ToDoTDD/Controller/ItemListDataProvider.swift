//
//  ItemListDataProvider.swift
//  ToDoTDD
//
//  Created by Yuta Lin on 2019/5/7.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import UIKit

enum Section: Int {
    case toDo
    case done
}

class ItemListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var itemManager: ItemManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let itemManager = itemManager  else {
            return 0
        }
        
        guard let itemSection = Section(rawValue: section)  else {
            fatalError()
        }
        
        let numberOfRows: Int
        switch itemSection {
        case .toDo:
            numberOfRows = itemManager.toDoCount
        case .done:
            numberOfRows = itemManager.doneCount
        }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        guard let itemManager = itemManager else { fatalError() }
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        
        let item: ToDoItem
        switch section {
        case .toDo:
            item = itemManager.itemAtIndex(indexPath.row)
        case .done:
            item = itemManager.doneItemAtIndex(indexPath.row)
        }
        cell.configCell(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        
        let buttonTitle: String
        switch section {
        case .toDo:
            buttonTitle = "Check"
        case .done:
            buttonTitle = "UnCheck"
        }
        
        return buttonTitle
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let itemManager = itemManager else { fatalError() }
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        switch section {
        case .toDo:
            itemManager.checkItemAtIndex(indexPath.row)
        case .done:
            itemManager.uncheckItem(at: indexPath.row)
        }
        tableView.reloadData()
    }
    
}
