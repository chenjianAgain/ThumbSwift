//
//  ZDMyAccounViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/12.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

@objc
protocol ZDMyAccounViewControllerDelegate {
    func myAccounViewControllerShouldLogout(viewController: UIViewController)
}
    

class ZDMyAccounViewController: UITableViewController {
    
    var delegate: ZDMyAccounViewControllerDelegate?
    
    @IBAction func logout() {
        if delegate != nil {
            self.delegate?.myAccounViewControllerShouldLogout(self)
        }
    }
}
