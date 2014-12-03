//
//  IncomeViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/25.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDIncomeViewController: UIViewController {

    @IBOutlet weak var accountTotalLabel: UILabel!
    @IBOutlet weak var incomeTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var customerId = ZDLoginStore.sharedInstance.currentCustomer?.customerId
        if customerId != nil {
            ZDWebService.sharedWebService().getProductOrderListsWithCustomerId(customerId, { (error, resultDic) -> Void in
                println(resultDic)
                if (error == nil) {
                    self.accountTotalLabel.text = resultDic["accountTotal"] as? String
                    self.incomeTotalLabel.text = resultDic["incomeTotal"] as? String
                }
            })
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
