//
//  BaseViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/16.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    @IBAction func tapGestureClicked() {
        self.view.endEditing(true)
    }
}
