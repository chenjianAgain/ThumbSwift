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
}

class ZDLoginTableViewController: UITableViewController {
    
    var delegate: ZDLoginTableViewControllerDelegate?
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
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
                if self.delegate != nil {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.delegate!.loginViewControllerDidLoggedIn(self)
                    })
                }
            }
        })
    }


}
