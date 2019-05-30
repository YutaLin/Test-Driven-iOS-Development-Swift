//
//  InputViewController.swift
//  ToDoTDD
//
//  Created by Yuta Lin on 2019/5/30.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
