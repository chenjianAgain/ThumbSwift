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
    

class ZDMyAccounViewController: UIViewController, UITableViewDelegate, ZDAccountSecurityTableViewControllerDelegate {
    
    var delegate: ZDMyAccounViewControllerDelegate?
    @IBOutlet weak var tableView: UITableView?
    
    @IBAction func logout() {
        if delegate != nil {
            self.delegate?.myAccounViewControllerShouldLogout(self)
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }
    
    // MARK: - ZDAccountSecurityTableViewControllerDelegate
    
    func accountSecurityTableViewControllerShouldLogout(viewController: UIViewController) {
        if delegate != nil {
            self.delegate?.myAccounViewControllerShouldLogout(self)
        }
        self.navigationController?.popToRootViewControllerAnimated(false)
    }
    
    // MARK: - Private Method
    
    func mockData(index: NSInteger) -> (UIImage, NSString) {

        let image1 = UIImage(named: "icon_fortune")
        let image2 = UIImage(named: "icon_trade")
        let image3 = UIImage(named: "icon_safe")
        let image4 = UIImage(named: "icon_service")
        
        if index == 0 { return (image1!, "理财记录") }
        else if index == 1 { return (image2!, "交易明细") }
        else if index == 2 { return (image3!, "账户安全") }
        else { return (image4!, "我的客户经理") }
    }
    
    // MARK: - table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Configure the cell...
        var cell: ZDAccountTableViewCell = ZDAccountTableViewCell.cellWithTableView(tableView)!
        cell.configViewWithData(mockData(indexPath.row))
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == 2 {
            self.performSegueWithIdentifier("Show Account Security", sender: self)
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Show Account Security" {
            let accountSecurityTableViewController = segue.destinationViewController as ZDAccountSecurityTableViewController
            accountSecurityTableViewController.delegate = self
        }
    }
}
