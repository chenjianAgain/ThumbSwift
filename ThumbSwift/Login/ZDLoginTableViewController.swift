//
//  ZDLoginTableViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/12.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

@objc
protocol ZDLoginTableViewControllerDelegate {
    func loginViewControllerDidLoggedIn(viewController: UIViewController)
    func loginViewControllerDidLoggedOut(viewController: UIViewController)
}

class ZDLoginTableViewController: UITableViewController {
    
    var delegate: ZDLoginTableViewControllerDelegate?
    
    @IBAction func logout() {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            if self.delegate != nil {
                self.delegate?.loginViewControllerDidLoggedOut(self)
            }
        })
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            self.doSignInAction()
        }
    }
    
    func doSignInAction() {
        ZDWebService.sharedWebService().loginWithUserName("13818111655", password: "123456", { (error, resultDic) -> Void in
            println(resultDic)
            if (error == nil) {
                NSUserDefaults.standardUserDefaults().setObject("13818111655", forKey: "DefaultCurrentUserId")
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    if self.delegate != nil {
                        self.delegate!.loginViewControllerDidLoggedIn(self)
                    }
                })
            }
        })
    }


}
