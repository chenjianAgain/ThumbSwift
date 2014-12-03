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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(red: 244 / 255.0, green: 244 / 255.0, blue: 244 / 255.0, alpha: 1)
        self.hideExtraCellLine()
    }
    
    func hideExtraCellLine() {
        var view = UIView()
//        view.backgroundColor = UIColor.clearColor()
        if self.tableView.tableFooterView == nil {
//            self.tableView.tableHeaderView! = view
        }
    }
}
