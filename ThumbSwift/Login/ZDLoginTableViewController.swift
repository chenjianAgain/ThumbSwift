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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 0
//    }

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