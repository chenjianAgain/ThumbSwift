//
//  ZDAccountSecurityTableViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

@objc
protocol ZDAccountSecurityTableViewControllerDelegate {
    func accountSecurityTableViewControllerShouldLogout(viewController: UIViewController)
}

class ZDAccountSecurityTableViewController: UITableViewController {
    
    var delegate: ZDAccountSecurityTableViewControllerDelegate?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var idCardLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    @IBAction func logout() {
        self.showAlert()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.nameLabel.text = ZDLoginStore.sharedInstance.currentCustomer?.managerName
        self.idCardLabel.text = ZDLoginStore.sharedInstance.currentCustomer?.idnum
        self.phoneLabel.text = ZDLoginStore.sharedInstance.currentCustomer?.managerMobile
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 1 && indexPath.row == 0 {
            self.showAlert()
        }
    }
    
    func showAlert() {
        let alertVc = UIAlertController(title: "", message: "确定要退出吗？", preferredStyle: .ActionSheet)
        let okAction = UIAlertAction(title: "确定", style: .Default) { action -> Void in
            alertVc.dismissViewControllerAnimated(true, completion: nil)
            if self.delegate != nil {
                self.delegate?.accountSecurityTableViewControllerShouldLogout(self)
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: .Default) { action -> Void in
            alertVc.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alertVc.addAction(okAction)
        alertVc.addAction(cancelAction)
        self.presentViewController(alertVc, animated: true, completion: nil)
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
