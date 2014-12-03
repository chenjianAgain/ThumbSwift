//
//  ZDOfflineApplyViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/16.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDOfflineApplyViewController: UIViewController, ShowOfflineHeadViewControllerDelegate {

    var product: ZDProduct?
    @IBOutlet weak var objectCustomerLabel: UILabel!
    @IBOutlet weak var featureLabel: UILabel!

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
        self.objectCustomerLabel.text = self.product?.objectCustomer
        self.featureLabel.text = self.product?.feature
    }

    
    func showOfflineHeadViewControllerShouldReturn(viewController: UIViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "Show Offline Head" {
            var headVc = segue.destinationViewController as ShowOfflineHeadViewController
            headVc.delegate = self
            headVc.product = product
        }
        // Pass the selected object to the new view controller.
    }
    
}
