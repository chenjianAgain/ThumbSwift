//
//  FinancialTableViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDFinancialTableViewController: BaseViewController, ZDSelectionViewControllerDelegate {
    
    var data: NSArray?
    var selectedProduct: ZDProduct?
    var segmentControllSelectedIndex = 1
    
    var _viewController: ZDSelectionViewController?
    var viewController: ZDSelectionViewController? {
        get {
            if _viewController == nil {
                var storyboard = UIStoryboard(name: "StoryboardOne", bundle: nil)
                _viewController = storyboard.instantiateViewControllerWithIdentifier("ZDSelectionViewController") as? ZDSelectionViewController
                _viewController?.delegate = self
            }
            return _viewController
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideExtraCellLine()
        self.data = ZDFinancialStore.sharedInstance.onlineProducts
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        return self.viewController?.view
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50;
    }
    
    // MARK: - ZDSelectionViewControllerDelegate
    
    func segmentControlDidChanged(viewController: UIViewController, selectedIndex: NSInteger)
    {
        self.segmentControllSelectedIndex = selectedIndex
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Configure the cell...
        var cell: UITableViewCell
        let oldCell = ZDOldFinancialTableViewCell.cellWithTableView(self.tableView) as ZDOldFinancialTableViewCell!
        var item = data![indexPath.row] as ZDProduct
        oldCell.product = item
        cell = oldCell

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.selectedProduct = self.data![indexPath.row] as? ZDProduct
        self.performSegueWithIdentifier("Show Online Detail", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Embed Selection" {
            var selectionViewController = segue.destinationViewController as ZDSelectionViewController
            selectionViewController.delegate = self
        } else if segue.identifier == "Show Online Detail" {
            var onlineApplyViewController = segue.destinationViewController as ZDOnlineApplyViewController
            onlineApplyViewController.product = self.selectedProduct
            onlineApplyViewController.isPlanA = segmentControllSelectedIndex == 0
        }
    }
    
    // MARK: - Actions
    @IBAction func bannerTapped() {
        self.performSegueWithIdentifier("Show Banner", sender: self)
    }

}
