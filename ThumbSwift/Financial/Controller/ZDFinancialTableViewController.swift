//
//  FinancialTableViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDFinancialTableViewController: UITableViewController, ZDSelectionViewControllerDelegate {
    
//    var data = ["证大年丰","证大月收","证大季喜","证大岁悦","证大双鑫"]
    var data: NSArray?
    var selectedProduct: Product?
    var segmentControllSelectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.data = ZDFinancialStore.sharedInstance.products
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ZDSelectionViewControllerDelegate
    
    func segmentControlDidChanged(viewController: UIViewController, selectedIndex: NSInteger)
    {
//        self.segmentControllSelectedIndex = selectedIndex
//        self.tableView.reloadData()
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
        if self.segmentControllSelectedIndex == 0 {
            let oldCell = ZDOldFinancialTableViewCell.cellWithTableView(self.tableView) as ZDOldFinancialTableViewCell!
            var item = data![indexPath.row] as Product
            oldCell.product = item
            cell = oldCell
        } else {
            let newCell = ZDNewFinancialTableViewCell.cellWithTableView(self.tableView) as ZDNewFinancialTableViewCell!
            cell = newCell
        }
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.selectedProduct = self.data![indexPath.row] as? Product
        self.performSegueWithIdentifier("Show Offline Detail", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Embed Selection" {
            var selectionViewController = segue.destinationViewController as ZDSelectionViewController
            selectionViewController.delegate = self
        } else if segue.identifier == "Show Offline Detail" {
            var offlineApplyViewController: ZDOfflineApplyViewController = segue.destinationViewController as ZDOfflineApplyViewController
            offlineApplyViewController.product = self.selectedProduct
        }
        
        
    }

}
