//
//  ZDSettingTableViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/12/1.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDSettingTableViewController: UITableViewController, ZDQuestionBackViewControllerDelegate {
    
    // MARK: - ZDQuestionBackViewControllerDelegate
    
    func questionBackViewControllerDidSuccess(viewController: UIViewController) {
        self.navigationController?.popToViewController(self, animated: false)
        var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "意见反馈成功"
        hud.hide(true, afterDelay: 2)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "questionBack" {
            (segue.destinationViewController as ZDQuestionBackViewController).delegate = self
        } else if segue.identifier == "Show Common Sense" {
            (segue.destinationViewController as ZDCommonSenseViewController).onlineHtml = "http://api.ezendai.com:8888/cm/V2/HTML/help.html"
        }
    }

    // MARK: - Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 4 {
            if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
                let phoneUrl = NSURL(string: "telprompt://4008216888")
                UIApplication.sharedApplication().openURL(phoneUrl!)
            } else {
                let alertVc = UIAlertController(title: "警告", message: "该设备没有通话模块", preferredStyle: .Alert)
                let okAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
                    alertVc.dismissViewControllerAnimated(true, completion: nil)
                }
                alertVc.addAction(okAction)
                self.presentViewController(alertVc, animated: true, completion: nil)
            }
        }
    }

}
