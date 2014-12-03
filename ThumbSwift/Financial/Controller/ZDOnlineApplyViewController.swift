//
//  ZDOnlineApplyViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/12/3.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDOnlineApplyViewController: UIViewController, ShowOfflineHeadViewControllerDelegate {

    var product: ZDProduct?
    

    func showOfflineHeadViewControllerShouldReturn(viewController: UIViewController) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Show Head" {
            var headVc = segue.destinationViewController as ShowOfflineHeadViewController
            headVc.delegate = self
            headVc.product = product
        }
    }
    

}
