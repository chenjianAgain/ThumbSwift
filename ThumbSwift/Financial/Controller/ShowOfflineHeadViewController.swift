//
//  ShowOfflineHeadViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/16.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

@objc

protocol ShowOfflineHeadViewControllerDelegate {
    func showOfflineHeadViewControllerShouldReturn(viewController: UIViewController)
}

class ShowOfflineHeadViewController: UIViewController {

    
    var product: Product? 
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var predictInterestLabel: UILabel!
    @IBOutlet weak var atLeastMoneyLabel: UILabel!
    @IBOutlet weak var closePeriodLabel: UILabel!
    
    var delegate: ShowOfflineHeadViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productNameLabel.text = product!.name
        self.predictInterestLabel.text = product!.predictInterest
        self.atLeastMoneyLabel.text = "起投金额 " + product!.atLeastMoney!
        self.closePeriodLabel.text = "锁定期 " + product!.closePeriod!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        if self.delegate != nil {
            self.delegate!.showOfflineHeadViewControllerShouldReturn(self)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
