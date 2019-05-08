//
//  ItemCell.swift
//  ToDoTDD
//
//  Created by Yuta Lin on 2019/5/7.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configCell(with item: ToDoItem) {
        titleLabel.text = item.title
        
        if let timestamp = item.timestamp {
            let date = Date(timeIntervalSince1970: timestamp)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            dateLabel.text = dateFormatter.string(from: date)
        }
    }
}
