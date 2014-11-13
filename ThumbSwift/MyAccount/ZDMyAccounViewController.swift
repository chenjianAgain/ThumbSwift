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
    func myAccounViewControllerDidLogout(viewController: UIViewController)
}
    

class ZDMyAccounViewController: UITableViewController, ZDLoginTableViewControllerDelegate {
    
    var delegate: ZDMyAccounViewControllerDelegate?
    
    func loginViewControllerDidLoggedIn(viewController: UIViewController) {
        
    }
    
    func loginViewControllerDidLoggedOut(viewController: UIViewController) {
        if delegate != nil {
            self.delegate?.myAccounViewControllerDidLogout(self)
        }
    }
    
    @IBAction func logout() {
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "DefaultCurrentUserId")
        var loginNav = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as UINavigationController
        var loginVC = loginNav.topViewController as ZDLoginTableViewController
        loginVC.delegate = self
        self.presentViewController(loginNav, animated: true, completion: nil)
    }
}
