//
//  ZDAboutUsTableViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDAboutUsTableViewController: UITableViewController {

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "Show Function Brief" {
            var destinationViewController = segue.destinationViewController as ZDCommonSenseViewController
            destinationViewController.onlineHtml = "http://api.ezendai.com:8888/cm/V2/HTML/introduce.html"
            destinationViewController.navigationTitle = "功能介绍"
        } else if segue.identifier == "Show User Agreement" {
            var destinationViewController = segue.destinationViewController as ZDCommonSenseViewController
            destinationViewController.onlineHtml = "http://api.ezendai.com:8888/cm/V2/HTML/serviceAgreement.html"
            destinationViewController.navigationTitle = "用户服务协议"
        }
    }
}
